module Yoolk
  module Liquid
    class Facebook::PageDrop < BaseDrop
      attributes  :id, :facebook_id, :name, :link, :cover_photo_url

      def facebook_id
        object.page_id
      end

      def name
        object.page_name
      end

      def link
        object.page_url
      end
    end
  end
end