module Yoolk
  module Liquid
    class BaseDrop < ::Liquid::Rails::Drop

      def id
        object.id.to_s
      end
    end
  end
end