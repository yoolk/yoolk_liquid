module Yoolk
  module Liquid

    class BreadcrumbTag < ::Liquid::Tag

      Syntax_class = /\s*class\s*=\s*(#{::Liquid::QuotedString})/
      Syntax_sep   = /\s*sep\s*=\s*(#{::Liquid::QuotedString})/

      def initialize(tag_name, markup, options)
        super

        if markup.present?

          unless correct_syntax(markup)
            raise SyntaxError.new('Syntax Error - Valid syntax: {% breadcrumb class="some-class" sep="&raquo;" %}')
          end

          @class_name   = $1 if markup =~ Syntax_class
          @separator    = $1 if markup =~ Syntax_sep
        end

      end

      def correct_syntax markup
      end

      def render(context)
        @context = context

        unless request.home_page?
          list_items = if request.map_page? then list translate 'map'
          elsif request.about_us_page?      then list translate 'about_us'
          elsif request.brochures_page?     then list translate 'brochures'
          elsif request.people_page?        then list translate 'people'
          elsif request.reservation_page?   then list translate 'reservation'
          elsif request.feedback_page?      then list translate 'feedback'
          elsif request.contact_us_page?    then list translate 'contact_us'
          else
            if collection_category?
              collection_with_category
              if item_detail?
                unless announcements? or galleries?
                  category = view.content_tag :li do
                    view.link_to category_name, category_url
                  end
                end

                list_collection = view.content_tag :li do view.link_to( collection_name, collection_url ) end
                if category
                  list_home.concat(list_collection.concat(category.concat( view.content_tag :li, item_detail )))
                else
                  list_home.concat(list_collection.concat view.content_tag :li, item_detail)
                end
              else
                collection_with_category.concat(view.content_tag :li, category_name)
              end
            else
              list_home.concat( view.content_tag :li,  collection_name )
            end
          end

          %Q{
            <ol class="#{ @class_name || 'breadcrumb' }">
            #{ list_items }
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

      def category_name
        category_id = controller.params["category_id"] || controller.params["id"]
        category_id[category_id.index("-") + 1..category_id.length]
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

        def request
          @context['request']
        end

        def collection_category?
          controller.action_name != 'index'
        end

    end
  end
end

Liquid::Template.register_tag('breadcrumb', Yoolk::Liquid::BreadcrumbTag)