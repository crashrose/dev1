module ActiveAdmin
  module Views
    class Header < Component

      def build(namespace, menu, function=nil)
        super(:id => "nav_header")

        @namespace = namespace
        @menu = menu
        @utility_menu = @namespace.fetch_menu(:utility_navigation)

        if function != nil
          send(function)
        else
          build_site_title
          build_global_navigation
          build_utility_navigation
        end
        # you can add any other component here in header section 
      end # end build method


      def build_global_navigation
        insert_tag view_factory.global_navigation, @menu, class: 'header-item tabs nav nav-pills nav-stacked'
      end

    end # end Header class


    module Pages
      class Base < Arbre::HTML::Document

        def build_page
          within @body do
            div class: "content" do
              div class: "background wrapper" do
                div class: "background aa_left_nav" do
                end
                div class: "background content_wrapper" do
                  div class: "background aa_main_content" do
                  end
                end
              end
              div class: "center_block wrapper" do
                div class: "content" do
                  div class: "top_block top_header" do
                    div class: "content" do
                      build_top_header
                    end
                  end
                  div class: "left_block aa_left_nav" do
                    div class: "content" do
                    # div class: "content pure-menu pure-menu-open" do
                      h4 text_node "Approve"
                      # text_node link_to "Approve".html_safe, '#', class: "pure-menu-heading"
                      # span class: "label label-default" do 
                      #   "Approve"
                      # end
                      div class: "content" do
                        build_left_nav(:approve)
                      end
                      h4 text_node "Configure"
                      div class: "content" do
                        build_left_nav(:configure)
                      end
                      h4 text_node "Report"
                      div class: "content" do
                        build_left_nav(:reporting)
                      end
                    end
                  end
                  div class: "center_block content_wrapper" do
                    div class: "content" do
                      div class: "top_block aa_page_title_bar" do
                        div class: "content" do
                          build_title_bar
                        end
                      end
                      div class: "center_block aa_main_content" do
                        div class: "content" do
                          build_page_content
                        end
                      end
                    end
                  end
                end
              end
            end # FIRST div class: "content" do ~~~ Starts Layout divs

          end # end within @body do
        end # end method build_page

        def build_left_nav(menu_name)
          menu = active_admin_namespace.menus.menu(menu_name)
          # text_node active_admin_namespace.menus.inspect.html_safe
          
          # active_admin_namespace.menus.ids.each do |menu|
          #   text_node menu.to_s.html_safe
          # end
          insert_tag view_factory.header, active_admin_namespace, menu, 'build_global_navigation'
        end

        def build_top_header
          insert_tag view_factory.header, active_admin_namespace, current_menu, 'build_site_title'
        end

      end # end Base class
    end # end Pages module



    class TabbedNavigation < Component

      def build_menu_item(item)
        
        li id: item.id do |li|
          li.add_class "active" if item.current? assigns[:current_tab]
          # open_span = "<span>".html_safe
          # close_span = "</span>".html_safe
          # text_node link_to open_span+item.label(self)+close_span, item.url(self), item.html_options

          text_node link_to "<span>".html_safe+item.label(self)+"</span>".html_safe, item.url(self), item.html_options
          

          if children = item.items(self).presence
            li.add_class "has_nested"
            ul class: 'nav nav-pills nav-stacked' do
              children.each{ |child| build_menu_item child }
            end # ul do
          end # if children
        end # li id: item.id do |li|

        # text_node item.items(self).inspect.html_safe
      end # end method build_menu_item

    end # end class TabbedNavigation



  end # end module Views


end # end module ActiveAdmin

