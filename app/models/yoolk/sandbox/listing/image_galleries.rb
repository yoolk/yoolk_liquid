module Yoolk
  module Sandbox
    class Listing::ImageGalleries < Collection
      def with_images
        @with_images ||= self.class.new(select { |gallery| gallery.images.present? })
      end
    end
  end
end