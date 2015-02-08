module Yoolk
  module Seo
    class Links::Show < Yoolk::Seo::Base

      def title
        "#{link.title} - #{listing_name}"
      end

      def description
        link.description
      end

      def link
        object
      end
    end
  end
end