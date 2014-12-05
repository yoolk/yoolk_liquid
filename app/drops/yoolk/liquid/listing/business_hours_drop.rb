module Yoolk
  module Liquid
    class Listing::BusinessHoursDrop < ::Liquid::Rails::CollectionDrop
      def today
        dropped_collection.select { |business_hour| business_hour.today? }
      end
    end
  end
end