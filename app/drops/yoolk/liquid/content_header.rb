module Yoolk
  module Liquid
    class ContentHeader
      attr_reader :listing, :view_context

      def initialize(listing, view_context)
        @listing      = listing
        @view_context = view_context
      end

      def to_s
        [csrf_meta_tags, google_analytics].compact.join("\n")
      end

      def csrf_meta_tags
        view_context.csrf_meta_tags
      end

      def google_analytics
        if Rails.env.production? && !listing.portal.labs?
          %{
          <script type="text/javascript">

            var _gaq = _gaq || [];
            _gaq.push(['_setAccount', '#{google_analytics_key}']);
            _gaq.push(['_trackPageview']);

            (function() {
              var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
              ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
            })();

          </script>
          }
        else
          nil
        end
      end

      private

        def google_analytics_key
          listing.instant_website.google_analytics_key.presence || 'UA-51188061-1'
        end
    end
  end
end