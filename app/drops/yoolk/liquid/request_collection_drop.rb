module Yoolk
  module Liquid
    class RequestCollectionDrop < RequestBaseDrop

      def name
        controller.controller_path.split("/")[0]
      end

      def announcements?
        controller.params['controller'] == 'announcements'
      end

      def galleries?
        controller.params['controller'] == 'galleries'
      end

      def url
        postfix = (name == 'menu') ? '_index_path' : '_path'
        eval(name + postfix)
      end

      def category?
        controller.action_name != 'index'
      end

      def category
        Yoolk::Liquid::RequestCategoryDrop.new(context)
      end
    end
  end
end