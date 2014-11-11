# Note for posterity:
#
# Here we have two core customizations on top of Formtastic. First, this allows
# you to build forms in the AA DSL without dealing with the HTML return value of
# individual form methods (hence the +form_buffers+ object). Second, this provides
# an intuitive way to build has_many associated records in the same form.
#
module ActiveAdmin
  class SFormBuilder < ::SimpleForm::FormBuilder

    attr_reader :form_buffers

    def initialize(*args)
      @form_buffers = ["".html_safe]
      super
    end

    def inputs(*args, &block)
      @use_form_buffer = block_given?
      form_buffers.last << with_new_form_buffer{ get_inputs(*args, &block) }
    end

    # If this `input` call is inside a `inputs` block, add the content
    # to the form buffer. Else, return it directly.
    def input(method, *args)
      content = with_new_form_buffer{ super }
      @use_form_buffer ? form_buffers.last << content : content
    end

    def cancel_link(url = {action: "index"}, html_options = {}, li_attrs = {})
      li_attrs[:class] ||= "cancel"
      li_content = template.link_to I18n.t('active_admin.cancel'), url, html_options
      form_buffers.last << template.content_tag(:li, li_content, li_attrs)
    end

    def actions(*args, &block)
      form_buffers.last << with_new_form_buffer do
        block_given? ? get_actions(*args, &block) : commit_action_with_cancel_link(*args, &block)
      end
    end

    def action(type, *args, &block)
      form_buffers.last << with_new_form_buffer{ get_action(type, *args, &block) }
    end

    def commit_action_with_cancel_link(*args, &block)
      action(:submit, *args, &block)
      cancel_link
    end

    def has_many(assoc, options = {}, &block)

      # remove options that should not render as attributes
      custom_settings = :new_record, :allow_destroy, :heading, :sortable
      builder_options = {new_record: true}.merge! options.slice  *custom_settings
      options         = {for: assoc      }.merge! options.except *custom_settings
      options[:class] = [options[:class], "inputs has_many_fields"].compact.join(' ')

      # Add Delete Links
      form_block = proc do |has_many_form|

        index    = parent_child_index options[:parent] if options[:parent]
        contents = block.call has_many_form, index

        if has_many_form.object.new_record?
          contents << template.content_tag(:li) do
            template.link_to I18n.t('active_admin.has_many_remove'), "#", class: 'button has_many_remove'
          end
        elsif builder_options[:allow_destroy]
          has_many_form.input :_destroy, as: :boolean, wrapper_html: {class: 'has_many_delete'},
                                                       label: I18n.t('active_admin.has_many_delete')
        end

        if builder_options[:sortable]
          has_many_form.input builder_options[:sortable], as: :hidden

          contents << template.content_tag(:li, class: 'handle') do
            Iconic.icon :move_vertical
          end
        end

        contents
      end

      # make sure that the sortable children sorted in stable ascending order
      if column = builder_options[:sortable]
        children = object.public_send(assoc).sort_by do |o|
          attribute = o.public_send column
          [attribute.nil? ? Float::INFINITY : attribute, o.id || Float::INFINITY]
        end
        options[:for] = [assoc, children]
      end

      html = without_wrapper do
        unless builder_options.key?(:heading) && !builder_options[:heading]
          form_buffers.last << template.content_tag(:h3) do
            builder_options[:heading] || object.class.reflect_on_association(assoc).klass.model_name.human(count: ::ActiveAdmin::Helpers::I18n::PLURAL_MANY_COUNT)
          end
        end

        inputs options, &form_block


        form_buffers.last << js_for_has_many(assoc, form_block, template, builder_options[:new_record], options[:class]) if builder_options[:new_record]
        form_buffers.last
      end

      # tag = @already_in_an_inputs_block ? :li : :div
      tag = :div
      form_buffers.last << template.content_tag(tag, html, class: "has_many_container #{assoc}", 'data-sortable' => builder_options[:sortable])

    end

    def semantic_errors(*args)
      form_buffers.last << with_new_form_buffer{ super }
    end

    protected

    def active_admin_input_class_name(as)
      "ActiveAdmin::Inputs::#{as.to_s.camelize}Input"
    end

    def input_class(as)
      @input_classes_cache ||= {}
      @input_classes_cache[as] ||= begin
        begin
          custom_input_class_name(as).constantize
        rescue NameError
          begin
            active_admin_input_class_name(as).constantize
          rescue NameError
            standard_input_class_name(as).constantize
          end
        end
      rescue NameError
        raise SimpleForm::UnknownInputError, "Unable to find input class for #{as}"
      end
    end

    # This method calls the block it's passed (in our case, the `f.inputs` block)
    # and wraps the resulting HTML in a fieldset. If your block doesn't have a
    # valid return value but it was otherwise built correctly, we instead use
    # the most recent part of the Active Admin form buffer.
    def field_set_and_list_wrapping(*args, &block)
      block_given? ? super{
        (val = yield).is_a?(String) ? val : form_buffers.last
      } : super
    end

    private

    def with_new_form_buffer
      form_buffers << ''.html_safe
      return_value = (yield || '').html_safe
      form_buffers.pop
      return_value
    end

    def without_wrapper
      is_being_wrapped = @already_in_an_inputs_block
      @already_in_an_inputs_block = false

      html = with_new_form_buffer{ yield }

      @already_in_an_inputs_block = is_being_wrapped
      html

    end

    # Capture the ADD JS
    def js_for_has_many(assoc, form_block, template, new_record, class_string)
      assoc_reflection = object.class.reflect_on_association assoc
      assoc_name       = assoc_reflection.klass.model_name
      placeholder      = "NEW_#{assoc_name.to_s.underscore.upcase}_RECORD"
      opts = {
        for: [assoc, assoc_reflection.klass.new],
        class: class_string,
        for_options: { child_index: placeholder }
      }
      html = with_new_form_buffer{ inputs_for_nested_attributes opts, &form_block }
      text = new_record.is_a?(String) ? new_record : I18n.t('active_admin.has_many_new', model: assoc_name.human)

      template.link_to text, '#', class: "button has_many_add", data: {
        html: CGI.escapeHTML(html).html_safe, placeholder: placeholder
      }
    end


      def get_inputs(*args, &block)
        wrap_it = @already_in_an_inputs_block ? true : false
        @already_in_an_inputs_block = true
        
        title = field_set_title_from_args(*args)
        html_options = args.extract_options!
        html_options[:class] ||= "inputs"
        html_options[:name] = title
        skipped_args = Array.wrap html_options.delete(:except)
# zzzz
        out = begin
          if html_options[:for] # Nested form
            inputs_for_nested_attributes(*(args << html_options), &block)
          elsif block_given?
            field_set_and_list_wrapping(*(args << html_options), &block)
          else
            legend = args.shift if args.first.is_a?(::String)
            args = default_columns_for_object - skipped_args if @object && args.empty?
            contents = fieldset_contents_from_column_list(args)
            args.unshift(legend) if legend.present?
            field_set_and_list_wrapping(*((args << html_options) << contents))
          end
        end

        out = template.content_tag(:li, out, :class => "input") if wrap_it
        @already_in_an_inputs_block = wrap_it

        out
      end

      protected
      
      def default_columns_for_object
        cols  = association_columns(:belongs_to)
        cols += content_columns
        cols -= SKIPPED_COLUMNS
        cols.compact
      end
      
      def fieldset_contents_from_column_list(columns)
        columns.collect do |method|
          if @object
            if @object.class.respond_to?(:reflect_on_association)
              if (@object.class.reflect_on_association(method.to_sym) && @object.class.reflect_on_association(method.to_sym).options[:polymorphic] == true)
                raise PolymorphicInputWithoutCollectionError.new("Please provide a collection for :#{method} input (you'll need to use block form syntax). Inputs for polymorphic associations can only be used when an explicit :collection is provided.")
              end
            elsif @object.class.respond_to?(:associations)
              if (@object.class.associations[method.to_sym] && @object.class.associations[method.to_sym].options[:polymorphic] == true)
                raise PolymorphicInputWithoutCollectionError.new("Please provide a collection for :#{method} input (you'll need to use block form syntax). Inputs for polymorphic associations can only be used when an explicit :collection is provided.")
              end            
            end            
          end
          input(method.to_sym)
        end
      end
      
      # Collects association columns (relation columns) for the current form object class. Skips
      # polymorphic associations because we can't guess which class to use for an automatically
      # generated input.
      def association_columns(*by_associations) #:nodoc:
        if @object.present? && @object.class.respond_to?(:reflections)
          @object.class.reflections.collect do |name, association_reflection|
            if by_associations.present?
              if by_associations.include?(association_reflection.macro) && association_reflection.options[:polymorphic] != true
                name 
              end
            else
              name
            end
          end.compact
        else
          []
        end
      end

      # Collects content columns (non-relation columns) for the current form object class.
      def content_columns #:nodoc:
        # TODO: NameError is raised by Inflector.constantize. Consider checking if it exists instead.
        begin klass = model_name.constantize; rescue NameError; return [] end
        return [] unless klass.respond_to?(:content_columns)
        klass.content_columns.collect { |c| c.name.to_sym }.compact
      end

      # Deals with :for option when it's supplied to inputs methods. Additional
      # options to be passed down to :for should be supplied using :for_options
      # key.
      #
      # It should raise an error if a block with arity zero is given.
      def inputs_for_nested_attributes(*args, &block) #:nodoc:
        
        options = args.extract_options!
        
        args << options.merge!(:parent => { :builder => self, :for => options[:for] })

        fields_for_block = if block_given?
          raise ArgumentError, 'You gave :for option with a block to inputs method, ' <<
                               'but the block does not accept any argument.' if block.arity <= 0
          lambda do |f|
            contents = f.inputs(*args) do

              if block.arity == 1  # for backwards compatibility with REE & Ruby 1.8.x
                block.call(f)
              else
                index = parent_child_index(options[:parent]) if options[:parent]
                block.call(f, index)
              end
            end
            template.concat(contents)
          end
        else
          lambda do |f|
            contents = f.inputs(*args)
            template.concat(contents)
          end
        end
options[:for_options] = {:class => options[:class]}
        fields_for_args = [options.delete(:for), options.delete(:for_options) || {}].flatten(1)
        # field_for_args
# zzzz
fields  = *fields_for_args
# zzzz
        fields_for(*fields_for_args, &fields_for_block)
      end

# Where I left off: Need to figgure out how and what parameters to pass to simple_fields_for in order to get the markup I want


      def field_set_title_from_args(*args) #:nodoc:
        options = args.extract_options!
        options[:name] ||= options.delete(:title)
        title = options[:name]

        if title.blank?
          valid_name_classes = [::String, ::Symbol]
          valid_name_classes.delete(::Symbol) if !block_given? && (args.first.is_a?(::Symbol) && content_columns.include?(args.first))
          title = args.shift if valid_name_classes.any? { |valid_name_class| args.first.is_a?(valid_name_class) }
        end
        title = localized_string(title, title, :title) if title.is_a?(::Symbol)
        title
      end


      def field_set_and_list_wrapping(*args, &block) #:nodoc:
        contents = args.last.is_a?(::Hash) ? '' : args.pop.flatten
        # zzzz
        html_options = args.extract_options!

        if block_given?
          contents = if template.respond_to?(:is_haml?) && template.is_haml?
            template.capture_haml(&block)
          else
            template.capture(&block)
          end
        end

        # Ruby 1.9: String#to_s behavior changed, need to make an explicit join.
        contents = contents.join if contents.respond_to?(:join)



if html_options[:type] == 'panel'
        html_options[:panel_class] = "panel panel-default" 
        html_options[:legend_class] = "panel-heading" 
        html_options[:title_class] = "panel-title" 
        html_options[:body_class] = "panel-body" 
elsif html_options[:type] == 'inner-panel'
        html_options[:panel_class] = "panel panel-info" 
        html_options[:legend_class] = "panel-heading" 
        html_options[:title_class] = "panel-title" 
        html_options[:body_class] = "panel-body" 
end

html_options[:panel_class] = [html_options[:class], html_options[:panel_class]].compact.join(' ')
        legend = field_set_legend(html_options)
        fieldset = template.content_tag(:div,
          legend.html_safe << template.content_tag(:div, contents.html_safe, class: html_options[:body_class]), class: html_options[:panel_class]) 

        fieldset
      end

      def field_set_legend(html_options)
        # zzzz
        legend  = (html_options[:name] || '').to_s
        legend %= parent_child_index(html_options[:parent]) if html_options[:parent]
        legend  = template.content_tag(:div, template.content_tag(:h3,legend, class: html_options[:title_class]).html_safe,
         class: html_options[:legend_class]).html_safe unless legend.blank?
        legend
      end

      # Gets the nested_child_index value from the parent builder. It returns a hash with each
      # association that the parent builds.
      def parent_child_index(parent) #:nodoc:
        # Could be {"post[authors_attributes]"=>0} or { :authors => 0 }
        duck = parent[:builder].instance_variable_get('@nested_child_index')
        
        # Could be symbol for the association, or a model (or an array of either, I think? TODO)
        child = parent[:for]
        # Pull a sybol or model out of Array (TODO: check if there's an Array)
        child = child.first if child.respond_to?(:first)
        # If it's an object, get a symbol from the class name
        child = child.class.name.underscore.to_sym unless child.is_a?(Symbol)
        
        key = "#{parent[:builder].object_name}[#{child}_attributes]"

        # TODO: One of the tests produces a scenario where duck is "0" and the test looks for a "1" 
        # in the legend, so if we have a number, return it with a +1 until we can verify this scenario.
        return duck + 1 if duck.is_a?(Fixnum)
        
        # First try to extract key from duck Hash, then try child
        (duck[key] || duck[child]).to_i + 1
      end

      def get_actions(*args, &block)
        html_options = args.extract_options!
        html_options[:class] ||= "actions"

        if block_given?
          field_set_and_list_wrapping(html_options, &block)
        else
          args = default_actions if args.empty?
          contents = args.map { |action_name| action(action_name) }
          field_set_and_list_wrapping(html_options, contents)
        end
      end

      def get_action(type, *args, &block)
        # options = options.dup # Allow options to be shared without being tainted by Formtastic
        # options[:as] ||= default_action_type(method, options)

        klass = button(type, *args, &block)
        # klass = action_class(options[:as])

        # klass.new(self, template, @object, @object_name, method, options).to_html
      end


      def default_action_type(method, options = {}) #:nodoc:
        case method
          when :submit then :input
          when :reset then :input
          when :cancel then :link
        end
      end

      def action_class(as)
        @input_classes_cache ||= {}
        @input_classes_cache[as] ||= begin
          begin
            begin
              custom_action_class_name(as).constantize
            rescue NameError
              standard_action_class_name(as).constantize
            end
          rescue NameError
            raise Formtastic::UnknownActionError
          end
        end
      end

      # :as => :button # => ButtonAction
      def custom_action_class_name(as)
        "#{as.to_s.camelize}Action"
      end

      # :as => :button # => Formtastic::Actions::ButtonAction
      def standard_action_class_name(as)
        "Formtastic::Actions::#{as.to_s.camelize}Action"
      end



      def simple_fields_for(record_name, record_object = nil, options = {}, &block)
        options, record_object = record_object, nil if record_object.is_a?(Hash) && record_object.extractable_options?
        options[:builder] ||= SimpleForm::FormBuilder
zzzzz
        with_simple_form_field_error_proc do
          fields_for(record_name, record_object, options, &block)
        end
      end



  end
end


# module SimpleForm
#   class FormBuilder
#     def association(association, options = {}, &block)
#       options = options.dup

#       return simple_fields_for(*[association,
#         options.delete(:collection), options].compact, &block) if block_given?

#       raise ArgumentError, "Association cannot be used in forms not associated with an object" unless @object

#       reflection = find_association_reflection(association)
#       raise "Association #{association.inspect} not found" unless reflection

#       options[:as] ||= :select
#       options[:collection] ||= fetch_association_collection(reflection, options)

#       attribute = build_association_attribute(reflection, association, options)
#     # if association == :person
#     # zzzz
#     # end
#       input(attribute, options.merge(reflection: reflection))
#     end
#   end
# end