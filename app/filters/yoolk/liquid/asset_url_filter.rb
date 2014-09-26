module Yoolk
  module Liquid
    module AssetUrlFilter
      def image_url(input, style)
        unless input.instance_of?(Yoolk::Liquid::AttachmentDrop)
          input = input.image
        end
        image_tag input.url(style)
      end
    end
  end
end
Liquid::Template.register_filter Yoolk::Liquid::AssetUrlFilter