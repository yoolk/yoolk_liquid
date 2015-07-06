module Yoolk
  module Seo
    class Home::Index < Yoolk::Seo::Base

      def title
        home_page.try(:meta_title)       || super
      end

      def description
        home_page.try(:meta_description) || super
      end

      def keywords
        home_page.try(:meta_keyword)     || super
      end

      private
      def home_page
        if listing.instant_website.present?
          listing.instant_website.pages.detect{ |page| page.template_page.home? }
        end
      end
    end
  end
end