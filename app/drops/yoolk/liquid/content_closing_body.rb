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
          fb_custom_audience_pixels_script,
          conversions_pixel_on_submitted_email_script
        ].compact.join("\n")
      end

      private

      def adwords_remarketing_script
        return [] if tracking_services.adwords_remarketing.empty?

        %(
          <!-- Adwords Remarketing Script -->
          #{ tracking_services.adwords_remarketing.map(&:script).join("\n").html_safe }
        )
      end

      def fb_custom_audience_pixels_script
        return [] if tracking_services.fb_custom_audience_pixels.empty?

        %(
          <!-- Facebook Custom Audience Pixels Script -->
          #{ tracking_services.fb_custom_audience_pixels.map(&:script).join("\n").html_safe }
        )
      end

      def conversions_pixel_on_submitted_email_script
        return [] if no_services_for_submitted_an_email? || !form_posted_successfully?

        [adwords_conversions_for_submitted_an_email, fb_conversion_pixels_for_submitted_an_email].flatten.map(&:script).join("\n".html_safe)
      end

      def no_services_for_submitted_an_email?
        adwords_conversions_for_submitted_an_email.empty? && fb_conversion_pixels_for_submitted_an_email.empty?
      end

      def adwords_conversions_for_submitted_an_email
        Array.wrap(tracking_services.adwords_conversions.try(:submitted_an_email))
      end

      def fb_conversion_pixels_for_submitted_an_email
        Array.wrap(tracking_services.fb_conversion_pixels.try(:submitted_an_email))
      end

      def adwords_conversions_script
        if    request.visited_any_page?
          tracking_services.adwords_conversions.visited_my_homepages.map(&:script)
        elsif request.added_a_product_to_cart?
          tracking_services.adwords_conversions.added_a_product_to_cart.map(&:script)
        elsif request.visited_my_homepage?
          tracking_services.adwords_conversions.visited_my_homepage.map(&:script)
        elsif request.clicked_on_checkout?
          tracking_services.adwords_conversions.clicked_on_checkout.map(&:script)
        elsif request.place_an_order?
          tracking_services.adwords_conversions.place_an_order.map(&:script)
        elsif request.submitted_an_email?
          tracking_services.adwords_conversions.submitted_an_email.map(&:script)
        end
      end

      def fb_conversion_pixels_script
        return [] if tracking_services.fb_conversion_pixels.empty?
        # Todo:: :visited_any_page, :added_a_product_to_cart, 
        #        :visited_my_homepage, :clicked_on_checkout, 
        #        :place_an_order, :submitted_an_email
        tracking_services.fb_conversion_pixels.map(&:script)
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
