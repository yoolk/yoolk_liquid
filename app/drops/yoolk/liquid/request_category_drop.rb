module Yoolk
  module Liquid
    class RequestCategoryDrop < RequestBaseDrop

      def name
        controller.params["category_id"] || controller.params["id"]
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
        controller.params['controller'].split("/")[0] != 'announcements' ? object.first.name : object.first.id
      end
    end
  end
end