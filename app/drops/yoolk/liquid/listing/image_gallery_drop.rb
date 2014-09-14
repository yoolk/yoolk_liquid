module Yoolk
  module Liquid
    class Listing::ImageGalleryDrop < BaseDrop
      attributes  :id, :name, :display_order, :to_param, :created_at, :updated_at

      has_many    :images, with: 'Yoolk::Liquid::Listing::GalleryImageDrop'

      def url
        gallery_url(self)
      end
    end
  end
end