module Yoolk
  module Liquid
    module InstantWebsite
      class TrackingServicesDrop < ::Liquid::Rails::CollectionDrop
        scope :adwords_conversions, :adwords_remarketing, 
              :fb_conversion_pixels, :fb_custom_audience_pixels,
              :visited_any_page, :added_a_product_to_cart,
              :visited_my_homepage, :clicked_on_checkout,
              :place_an_order, :submitted_an_email
      end
    end
  end
end
