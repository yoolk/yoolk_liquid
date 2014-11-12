module Yoolk
  module Liquid

    class RequestBase < BaseDrop
      attr_reader :context, :controller_name, :object

      def initialize(context)
        @context ||= context
        controller_base_name = controller.params['controller'].split("/")[0]
        @controller_name =  if controller_base_name == 'menu'
                              'foods'
                            else
                              controller_base_name
                            end

        collection = "listing.#{controller_name}"
        @object = @context[collection].select do |coll|
          coll.id.to_i == controller.params["id"].to_i
        end

      end
    end


    class RequestCategoryDrop < RequestBase

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

    class RequestCollectionDrop < RequestBase

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

    class RequestDrop < BaseDrop
      def initialize
      end

      def map_path
        map_index_path
      end

      def menu_path
        menu_index_path
      end

      def reservation_path
        reservation_index_path
      end

      def feedback_path
        feedback_index_path
      end

      def host
        request.host.gsub(/^www\./, '')
      end

      def collection
        Yoolk::Liquid::RequestCollectionDrop.new(@context)
      end

      def preview_mode?
        host.in?(['iw.yoolk.com', 'iwstaging.yoolk.com', 'localhost']) && request.params[:alias_id].present?
      end
    end
  end
end