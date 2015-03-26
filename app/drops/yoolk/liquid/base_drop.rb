module Yoolk
  module Liquid
    class BaseDrop < ::Liquid::Rails::Drop
      include Yoolk::Liquid::UrlFilter
      include Yoolk::Liquid::TranslateFilter

      def id
        object.id.to_s
      end

      ## Need to override, otherwise it will return the drop class name
      def to_param
        object.to_param
      end

    end
  end
end