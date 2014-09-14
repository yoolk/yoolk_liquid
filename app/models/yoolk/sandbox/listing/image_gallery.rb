module Yoolk
  module Sandbox
    class Listing::ImageGallery < Base

      attribute     :id,                Integer
      attribute     :uuid,              String
      attribute     :name,              String
      attribute     :display_order,     Integer
      attribute     :created_at,        DateTime
      attribute     :updated_at,        DateTime

      attribute     :gallery_images,    Array[Yoolk::Sandbox::Listing::GalleryImage]

      ## Alias Method
      alias_method  :images, :gallery_images

      def to_param
        "#{id}-#{name.parameterize}"
      end
    end
  end
end