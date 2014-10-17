module Yoolk
  module Seo
    class Products::Index < Yoolk::Seo::Base
      def title
        "Products - #{listing.name}"
      end

      def description
        "List of all products : #{product_names}"
      end

    private
      def product_names
        listing.products.take(6).map(&:name).join(', ')
      end
    end
  end
end