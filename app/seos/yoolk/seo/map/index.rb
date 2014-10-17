module Yoolk
  module Seo
    class Map::Index < Yoolk::Seo::Base
      def title
        "Map - #{listing.name}"
      end

      def description
        "Find #{listing.name} on map with full address: #{listing.address}"
      end
    end
  end
end