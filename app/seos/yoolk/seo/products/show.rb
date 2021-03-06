module Yoolk
  module Seo
    class Products::Show < Yoolk::Seo::Base
      def title
        "#{product.name} - #{listing.name}"
      end

      def description
        "#{product.description.to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip}"
      end

      def social_image
        return unless product.cover_photo

        product.cover_photo.url(:medium)
      end

      def social_url
        Rails.application.routes.url_helpers.product_url(product, host: super)
      end

      def product
        object
      end
    end
  end
end