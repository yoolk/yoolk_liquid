module Yoolk
  module Liquid
    class AttachmentDrop < BaseDrop
      attributes :id, :content_type

      def width(style=:original)
        style = style.to_s
        attachment_meta.fetch(style, {}).fetch('width', nil)
      end

      def height(style=:original)
        style = style.to_s
        attachment_meta.fetch(style, {}).fetch('height', nil)
      end

      def size(style=:original)
        style = style.to_s
        attachment_meta.fetch(style, {}).fetch('size', nil)
      end

      def url(style=:original)
        style = style.to_s
        attachment_meta.fetch(style, {}).fetch('url', nil)
      end

      private

        def attachment_meta
          object.attachment_meta
        end
    end
  end
end