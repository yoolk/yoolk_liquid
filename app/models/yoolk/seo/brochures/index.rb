module Yoolk
  module Seo
    class Brochures::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'links.brochures')} - #{listing_name}"
      end
      def description
        "#{I18n.t(:'seo.brochures_of')} #{listing_name}"
      end
    private
      def brochures_names
        listing.artworks.take(6).map(&:name).join(", ")
      end
    end
  end
end