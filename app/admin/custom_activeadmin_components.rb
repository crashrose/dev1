module ActiveAdmin
  module Views
    class Header < Component

      def build(namespace, menu)
        super(:id => "nav_header")

        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        build_site_title
        build_global_navigation
        build_utility_navigation
        # you can add any other component here in header section 
      end
    end


    module Pages
      class Base < Arbre::HTML::Document
        def build_page
          within @body do


            # div id: "wrapper" do
            #   div id: "header_nav" do
            #     build_header
            #   end
            #   div id: "content_pane" do
            #     div id: "title_bar_header" do
            #       build_title_bar
            #     end
            #     div id: "main_content" do
            #       build_page_content
            #     end
            #   end
            #   # div id: "footer_"
            #   # build_footer
            # end
          
            div id: "wrapper" do
              div class: "content" do
                div class: "aa_background aa_left_nav" do
                end
                div class: "left_block aa_left_nav" do
                  div class: "content" do
                    build_header
                  end
                end
                div class: "aa_background main_content" do
                end
                div class: "center_block main_content" do
                  div class: "content" do
                    build_title_bar
                    build_page_content
                    div class: "top_block aa_title_bar" do
                      div class: "content" do
                        
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end



    # Renders an ActiveAdmin::Menu as a set of unordered list items.
    #
    # This component takes cares of deciding which items should be
    # displayed given the current context and renders them appropriately.
    #
    # The entire component is rendered within one ul element.
    class TabbedNavigation < Component

      # attr_reader :menu

      # Build a new tabbed navigation component.
      #
      # @param [ActiveAdmin::Menu] menu the Menu to render
      # @param [Hash] options the options as passed to the underlying ul element.
      #
      # def build(menu, options = {})
      #   @menu = menu
      #   super(default_options.merge(options))
      #   build_menu
      # end

      # # The top-level menu items that should be displayed.
      # def menu_items
      #   menu.items(self)
      # end

      # def tag_name
      #   'ul'
      # end

      # private

      # def build_menu
      #   menu_items.each do |item|
      #     build_menu_item(item)
      #   end
      # end

      def build_menu_item(item)
        li id: item.id do |li|
          li.add_class "current" if item.current? assigns[:current_tab]
          open_span = "<span>".html_safe
          close_span = "</span>".html_safe
          text_node link_to open_span+item.label(self)+close_span, item.url(self), item.html_options
          # text_node "</span>".html_safe
          if children = item.items(self).presence
            li.add_class "has_nested"
            ul do
              children.each{ |child| build_menu_item child }
            end
          end
        end
      end

      # def default_options
      #   { id: "tabs" }
      # end
    end







  end
end


#   end
# end

  # def build_site_title
  #   render "admin/parts/logo"
  # end

  # def build_global_navigation
  #   render "admin/parts/main_nav"
  # end

  # def build_utility_navigation
  #   render 'admin/parts/language_options'
  #   insert_tag view_factory.global_navigation, @utility_menu, :id => "utility_nav", :class => 'header-item tabs'
  #   render 'admin/parts/branch_in_header'
  # end
 # end
 # module Pages
 #  class Base
 #    def build_page_content
 #      build_flash_messages
 #      div :id => :wizard_progress_bar do
 #        render 'admin/parts/wizard_progress_bar'
 #      end
 #      div :id => "active_admin_content", :class => (skip_sidebar? ? "without_sidebar" : "with_sidebar") do
 #        build_main_content_wrapper
 #        build_sidebar unless skip_sidebar?
 #      end
 #    end