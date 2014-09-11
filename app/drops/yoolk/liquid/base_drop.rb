module Yoolk
  module Liquid
    class BaseDrop < ::Liquid::Rails::Drop
      include Yoolk::Liquid::UrlFilter

      def id
        object.id.to_s
      end
    end
  end
end