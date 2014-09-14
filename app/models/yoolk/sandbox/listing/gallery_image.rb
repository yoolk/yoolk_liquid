module Yoolk
  module Sandbox
    class Listing::GalleryImage < Base

      attribute     :id,                Integer
      attribute     :caption,           String
      attribute     :display_order,     Integer
      attribute     :created_at,        DateTime
      attribute     :updated_at,        DateTime

      attribute     :image_gallery,     Yoolk::Sandbox::Listing::ImageGallery
      attribute     :image,             Yoolk::Sandbox::Attachment

      ## Delegate
      delegate      :styles, :width, :height, :size, :url,
                    to: :image

      ## Alias Method
      alias_method  :gallery, :image_gallery
    end
  end
end