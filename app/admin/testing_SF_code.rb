# module SimpleForm
# 	module Inputs

# 		class Base
# 			def html_options_for(namespace, css_classes)
# 				html_options = options[:"#{namespace}_html"]
# 				html_options = html_options ? html_options.dup : {}
# 				css_classes << html_options[:class] if html_options.key?(:class)
# 				html_options[:class] = css_classes unless css_classes.empty?

# 				html_options
# 			end

# 			def initialize(builder, attribute_name, column, input_type, options = {})
# 				super

# 				options		 = options.dup
# 				@builder		= builder
# 				@attribute_name		 = attribute_name
# 				@column		 = column
# 				@input_type		 = input_type
# 				@reflection		 = options.delete(:reflection)
# 				@options		= options.reverse_merge!(self.class.default_options)
# 				@required			 = calculate_required

# 				# Notice that html_options_for receives a reference to input_html_classes.
# 				# This means that classes added dynamically to input_html_classes will
# 				# still propagate to input_html_options.
# 				@html_classes = SimpleForm.additional_classes_for(:input) { additional_classes }

# 				@input_html_classes = @html_classes.dup
# 				if SimpleForm.input_class && !input_html_classes.empty?
# 					input_html_classes << SimpleForm.input_class
# 				end

# 				@input_html_options = html_options_for(:input, input_html_classes).tap do |o|
# 					o[:readonly]	= true if has_readonly?
# 					o[:disabled]	= true if has_disabled?
# 					o[:autofocus] = true if has_autofocus?
# 				end
# 			end
# 		end

# 		class CollectionRadioButtonsInput < CollectionInput
# 			def input
# 			label_method, value_method = detect_collection_methods

# 			@builder.send("collection_#{input_type}",
# 				attribute_name, collection, value_method, label_method,
# 				input_options, input_html_options, &collection_block_for_nested_boolean_style
# 			)
# 			# zzzz
# 			end
# 		end


# 		class BooleanInput
# 			def input
# 				if nested_boolean_style?
# 					build_hidden_field_for_checkbox +
# 					template.label_tag(nil, class: "checkbox") {
# 					build_check_box_without_hidden_field + inline_label
# 					}
# 				else
# 					build_check_box
# 				end
# 				# zzzz
# 			end
# 		end


# 	end



# 	module Wrappers
# 		def wrap(input, options, content)
# 			return content if options[namespace] == false

# 			tag = (namespace && options[:"#{namespace}_tag"]) || @defaults[:tag]
# 			return content unless tag

# 			klass = html_classes(input, options)
# 			opts  = html_options(options)
# 			opts[:class] = (klass << opts[:class]).join(' ').strip unless klass.empty?
# 			input.template.content_tag(tag, content, opts)
# 			# zzzz
# 		end


# 		class Root
# 			 def render(input)
# 				input.options.reverse_merge!(@options)
				
# 				super
# 				# zzzz
# 			end
# 		end
# 	end



# 	class FormBuilder < ActionView::Helpers::FormBuilder

# 		def input(attribute_name, options={}, &block)
# 			options = @defaults.deep_dup.deep_merge(options) if @defaults
# 			input = find_input(attribute_name, options, &block)

# 			chosen =
# 			if name = options[:wrapper] || find_wrapper_mapping(input.input_type)
# 				name.respond_to?(:render) ? name : SimpleForm.wrapper(name)
# 			else
# 				wrapper
# 			end
# 	# zzzz
# 			chosen.render input
# 		end
# 	end


# end
