module Yoolk
  module Seo
    class Home::Index < Yoolk::Seo::Base

      def title
        home_page.meta_title || super
      end

      def description
        home_page.meta_description || super
      end

      def keywords
        home_page.meta_keyword || super
      end

      private
      def home_page
        listing.instant_website.pages.find {|page| page.template_page.home? }
      end
    end
  end
end