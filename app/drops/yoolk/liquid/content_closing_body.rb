# This class is inserted just before the closing body.
# Currently, it is mainly used for google_adwords and facebook pixels.
# However, we could add more if needed.
module Yoolk
  module Liquid
    class ContentClosingBody
      attr_reader :listing, :view_context

      # @params listing [Yoolk::Mongo::Listing]
      # @params view_context Rails ViewContext
      def initialize(listing, view_context)
        @listing      = listing
        @view_context = view_context
      end

      def to_s
        return nil if tracking_services.empty? || preview_mode?

        [
          adwords_remarketing_script,
          fb_custom_audience_pixels_script,
          conversions_script
        ].compact.join("\n").html_safe
      end

      private

      def adwords_remarketing_script
        tracking_services.adwords_remarketing.map(&:script)
      end

      def fb_custom_audience_pixels_script
        tracking_services.fb_custom_audience_pixels.map(&:script)
      end

      # It includes conversion scripts for adword and facebook
      def conversions_script
        result  = []
        result += tracking_services.visited_any_page
        result += tracking_services.added_a_product_to_cart   # this needs to be rendered on every pages because we track based on click NOT on pageload (click-based script).
        result += tracking_services.visited_my_homepage       if home_page?
        result += tracking_services.submitted_an_email        if email_posted_successfully?
        result += tracking_services.clicked_on_checkout       if checkout_page?
        result += tracking_services.place_an_order            if orders_page? && flash.notice.present?

        result.map(&:script)
      end

      def tracking_services
        listing.instant_website.tracking_services
      end

      def preview_mode?
        view_context.preview_mode?
      end

      def email_posted_successfully?
        view_context.controller_name.in?(['contact_us', 'reservation', 'feedback']) && flash.notice.present?
      end

      def home_page?
        view_context.current_page?(controller: 'home', action: 'index')
      end

      def checkout_page?
        view_context.current_page?(controller: 'checkouts', action: 'new')
      end

      def orders_page?
        view_context.controller_name == 'orders' && view_context.action_name == 'show'
      end

      def flash
        view_context.flash
      end
    end
  end
end
