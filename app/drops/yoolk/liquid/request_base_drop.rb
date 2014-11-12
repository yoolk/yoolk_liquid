module Yoolk
  module Liquid
    class RequestBaseDrop < BaseDrop
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
  end
end