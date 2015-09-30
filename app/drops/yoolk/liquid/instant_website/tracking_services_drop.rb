module Yoolk
  module Liquid
    module InstantWebsite
      class TrackingServicesDrop < ::Liquid::Rails::CollectionDrop
        scope :adwords_remarketing, :adwords_conversions, 
              :fb_conversion_pixels, :fb_custom_audience_pixels
      end
    end
  end
end
