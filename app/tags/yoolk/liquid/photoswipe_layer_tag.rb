module Yoolk
  module Liquid
    class PhotoSwipeLayerTag < ::Liquid::Tag
      def initialize(tag_name, max, tokens)
         super
      end

      def render(context)
        context.registers[:view].render 'yoolk/liquid/photoswipe_layer.html'
      end
    end
  end
end

Liquid::Template.register_tag('photoswipe_layer', Yoolk::Liquid::PhotoSwipeLayerTag)