module Yoolk
  module Liquid
    class Listing::GalleryImageDrop < BaseDrop
      attributes  :id, :caption, :display_order,
                  :created_at, :updated_at

      belongs_to  :gallery, class_name: 'Yoolk::Liquid::Listing::ImageGalleryDrop'

      delegate    :styles, :width, :height, :size, :url,
                  to: :object
    end
  end
end