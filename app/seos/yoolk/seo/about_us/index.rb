module Yoolk
  module Seo
    class AboutUs::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.about_us')} - #{listing.name}"
      end

      def description
        "#{listing.catalog_items.first.try(:title)}, #{catalog_description}"
      end

    private
      def catalog_description
        listing.catalog_items.first.try(:html_text).to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip
      end
    end
  end
end