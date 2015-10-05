module Yoolk
  module Liquid
    class ContentClosingBody
      attr_reader :listing, :view_context

      def initialize(listing, view_context)
        @listing      = listing
        @view_context = view_context
      end

      def to_s
        return [] if tracking_services.empty? || preview_mode?

        [
          adwords_remarketing_script,
          fb_custom_audience_pixels_script,
          conversions_script
        ].flatten.join('\n').html_safe
      end

      private

      def adwords_remarketing_script
        tracking_services.adwords_remarketing.map(&:script)
      end

      def fb_custom_audience_pixels_script
        tracking_services.fb_custom_audience_pixels.map(&:script)
      end

      def array_wrap(array)
        Array.wrap(array).flatten
      end

      def conversions_script
        result =  []
        result << tracking_services.visited_any_page
        result << tracking_services.adwords_conversions.added_a_product_to_cart
        
        result << array_wrap(tracking_services.visited_my_homepage)  if controller_name.home?
        result << array_wrap(tracking_services.submitted_an_email)   if form_posted_successfully?

        result.map { |r| r.map(&:script) }
      end

      def tracking_services
        listing.instant_website.try(:tracking_services)
      end

      def preview_mode?
        view_context.preview_mode?
      end

      def form_posted_successfully?
        controller_name.in?(["contact_us", "reservation", "feedback"]) && flash.notice.present?
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
