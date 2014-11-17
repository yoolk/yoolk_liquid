module Yoolk
  module Liquid
    class RequestCategoryDrop < RequestBaseDrop

      def name
        collection_link.concat view.content_tag(:li, id)
      end

      def id
        controller.params["category_id"] || controller.params["id"]
      end

      def collection_link
        view.content_tag :li do
          view.link_to collection.name, collection.url
        end
      end

      def url
        path =  if controller.params['controller'] == "menu/foods"
                  "menu"
                else
                  controller.params['controller']
                end

        if path != 'galleries'
          eval "#{path}_category_url(object.first.category)"
        else
          object.first.name
        end
      end

      def item_detail?
        !controller.controller_path.ends_with?("categories")
      end

      def item_detail
        detail = announcements_page? ? object.first.name : object.first.name
        category = view.content_tag :li do
          view.link_to id, url
        end
        collection_link.concat category.concat(view.content_tag :li, detail)
      end

      def collection
        ::Yoolk::Liquid::RequestCollectionDrop.new context
      end
    end
  end
end