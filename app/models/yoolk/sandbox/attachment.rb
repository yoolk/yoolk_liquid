module Yoolk
  module Sandbox
    class Attachment < Yoolk::Sandbox::Base

      attribute     :id,                String
      attribute     :content_type,      String
      attribute     :attachment_meta,   Hash

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

    end
  end
end