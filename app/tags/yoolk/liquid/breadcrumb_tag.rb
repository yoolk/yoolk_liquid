module Yoolk
  module Liquid

    class BreadcrumbTag < ::Liquid::Tag

      Syntax = /(#{::Liquid::QuotedString})\s*class_active\s*=\s*(#{::Liquid::QuotedString})/

      def initialize(tag_name, markup, options)
        super

        if markup =~ Syntax
          @class_name   = 'breadcrumb'
          @separator    = $1
          @class_active = $2
        else
          raise SyntaxError.new('Syntax Error - Valid syntax: {% breadcrumb separator="&raquo;" class_active="active" %}')
        end
      end

      def render(context)
        @context = context
        unless home_page?
          list_item = if map_page?  then list translate 'map'
          elsif about_us_page?      then list translate 'about_us'
          elsif brochures_page?     then list translate 'brochures'
          elsif people_page?        then list translate 'people'
          elsif reservation_page?   then list translate 'reservation'
          elsif feedback_page?      then list translate 'feedback'
          elsif contact_us_page?    then list translate 'contact_us'
          else
            if collection_category?
              collection_with_category
              if item_detail?
                category = unless announcements? or galleries?
                  view.content_tag :li do
                    view.link_to category_namea, category_url
                  end
                end
                if category
                  category.concat( view.content_tag :li, item_detail )
                else
                  view.content_tag :li, item_detail
                end
              else
                category_namea
              end
            else
              list_home.concat( view.content_tag :li,  collection_name )
            end
          end

          %Q{
            <ol class="#{ @class_name }">
            #{ list_item }
            </ol>
          }
        end
      end

      def object
        controller_base_name = controller.params['controller'].split("/")[0]
        @controller_name =  if controller_base_name == 'menu'
                              'foods'
                            else
                              controller_base_name
                            end

        collection = "listing.#{@controller_name}"
        @object = @context[collection].select do |coll|
          coll.id.to_i == controller.params["id"].to_i
        end
      end

      def category_url
        path =  if controller.params['controller'] == "menu/foods"
                  "menu"
                else
                  controller.params['controller']
                end

        if path != 'galleries'
          eval "view.#{path}_category_url(object.first.category)"
        else
          object.first.name
        end
      end

      def item_detail
        controller.params['controller'].split("/")[0] != 'announcements' ? object.first.name : object.first.id
      end

      def announcements?
        controller.params['controller'] == 'announcements'
      end

      def galleries?
        controller.params['controller'] == 'galleries'
      end

      def category_namea
        controller.params["category_id"] || controller.params["id"]
      end

      def item_detail?
        !controller.controller_path.ends_with?("categories") and controller.controller_path != 'galleries' and controller.action_name == 'show'
      end

      def list_home
        view.content_tag :li do
          view.link_to translate('home'), view.root_path
        end
      end

      def list( text, url = "" )
        list_home.concat view.content_tag :li, text
      end

      def collection_with_category
        list_cat = view.content_tag :li do
          view.link_to collection_name, collection_url
        end
        list_home.concat list_cat
      end

      def collection_url
        postfix = (collection_name == 'menu') ? '_index_path' : '_path'
        eval('view.' + collection_name + postfix)
      end

      def collection_name
        controller.controller_path.split("/")[0]
      end

      def translate key
        I18n::t "#{controller.request.params[:theme]}.links.#{key}"
      end

      def controller
        @context.registers[:controller]
      end

      def view
        @context.registers[:view]
      end

      private

        def home_page?
          controller.request.fullpath == view.root_path
        end

        def map_page?
          controller.request.fullpath.start_with?(view.map_index_path.split('?')[0])
        end

        def about_us_page?
          controller.request.fullpath.start_with?(view.about_us_path.split('?')[0])
        end

        def brochures_page?
          controller.request.fullpath.start_with?(view.brochures_path.split('?')[0])
        end

        def people_page?
          controller.request.fullpath.start_with?(view.people_path.split('?')[0])
        end

        def reservation_page?
          controller.request.fullpath.start_with?(view.reservation_index_path.split('?')[0])
        end

        def feedback_page?
          controller.request.fullpath.start_with?(view.feedback_index_path.split('?')[0])
        end

        def contact_us_page?
          controller.request.fullpath.start_with?(view.contact_us_path.split('?')[0])
        end

        def collection_category?
          controller.action_name != 'index'
        end

    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)