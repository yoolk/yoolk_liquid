module Yoolk
  module Sandbox
    class ProductCatalog::Products < Collection
      def published
        select { |item| item.published == true }
      end

      def storefronts
        select { |item| item.storefront == true }
      end
    end
  end
end