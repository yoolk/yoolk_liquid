module Yoolk
  module Liquid
    class ContentClosingBody
      attr_reader :listing, :view_context

      def initialize(listing, view_context)
        @listing      = listing
        @view_context = view_context
      end

      def to_s
        return [] if tracking_services.empty? #|| preview_mode?

        [
          adwords_remarketing_script,
          adwords_conversions_script,
          fb_conversion_pixels_script,
          fb_custom_audience_pixels_script
        ].compact.join("\n")
      end

      private

      def adwords_remarketing_script
        return [] if tracking_services.adwords_remarketing.empty?
        
        tracking_services.adwords_remarketing.map(&:script)
      end

      def adwords_conversions_script
        binding.pry
        if request.home_page?
          instant_website.tracking_services.adwords_conversions.visited_my_homepages.map(&:script)
        elsif request.checkout_page?

        end
      end

      def fb_conversion_pixels_script
        return [] if tracking_services.fb_conversion_pixels.empty?
        # Todo:: :visited_any_page, :added_a_product_to_cart, 
        #        :visited_my_homepage, :clicked_on_checkout, 
        #        :place_an_order, :submitted_an_email
        tracking_services.fb_conversion_pixels.map(&:script)
      end

      def fb_custom_audience_pixels
        return [] if tracking_services.fb_custom_audience_pixels.empty?
        
        tracking_services.fb_custom_audience_pixels.map(&:script)
      end

      def tracking_services
        listing.instant_website.try(:tracking_services)
      end

      def preview_mode?
        view_context.preview_mode?
      end

      def contact_us_posted_successfully?
        controller_name.contact_us? && flash.notice.present?
      end

      def controller_name
        view_context.controller.controller_name.inquiry
      end

      def flash
        view_context.flash
      end
    end
  end
end
