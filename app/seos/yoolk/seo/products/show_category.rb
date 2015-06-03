module Yoolk
  module Seo
    class Products::ShowCategory < Yoolk::Seo::Base
      def title
        "#{product.name} - #{listing.name}"
      end

      def description
        "#{product.description.to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip}"
      end

      def product
        object
      end
    end
  end
end