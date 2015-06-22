module Yoolk
  module Sandbox
    class Listing::CatalogItems < Collection
      def published
        self.class.new(select { |item| item.published? })
      end

      def with_images
        self.class.new(select { |item| item.image.present? })
      end
    end
  end
end