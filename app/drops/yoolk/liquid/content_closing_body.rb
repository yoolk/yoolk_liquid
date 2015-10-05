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
          conversions_script
        ].flatten.join('\n').concat(google_conversion_added_a_product_to_cart).html_safe
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
        # result << tracking_services.added_a_product_to_cart
        
        result << array_wrap(tracking_services.visited_my_homepage)  if controller_name.home?
        result << array_wrap(tracking_services.submitted_an_email)   if form_posted_successfully?

        result.map { |r| r.map(&:script) }
      end

      def google_conversion_added_a_product_to_cart
        %(<!-- Google Code for tet Conversion Page
          In your html page, add the snippet and call
          goog_report_conversion when someone clicks on the
          chosen link or button. -->
          <script type="text/javascript">
            /* <![CDATA[ */
            goog_snippet_vars = function() {
              var w = window;
              w.google_conversion_id = 962880020;
              w.google_conversion_label = "nkLgCK3KmGAQlMSRywM";
              w.google_remarketing_only = false;
            }
            // DO NOT CHANGE THE CODE BELOW.
            goog_report_conversion = function(url) {
              goog_snippet_vars();
              window.google_conversion_format = "3";
              window.google_is_call = true;
              var opt = new Object();
              opt.onload_callback = function() {
              if (typeof(url) != 'undefined') {
                window.location = url;
              }
            }
            var conv_handler = window['google_trackConversion'];
            if (typeof(conv_handler) == 'function') {
              conv_handler(opt);
            }
          }
          /* ]]> */
          </script>
          <script type="text/javascript"
            src="//www.googleadservices.com/pagead/conversion_async.js">
          </script>
)
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
