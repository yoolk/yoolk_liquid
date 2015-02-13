module Yoolk
  module Liquid
    class Listing::AnnouncementDrop < BaseDrop
      attributes  :id, :text, :to_param,
                  :created_at, :updated_at

      belongs_to  :image, class_name: 'Yoolk::Liquid::AttachmentDrop'

      def text
        h.auto_link(h.simple_format(object.text))
      end

      def h
        @context.registers[:helper]
      end

      def url
        announcement_url(self)
      end
    end
  end
end