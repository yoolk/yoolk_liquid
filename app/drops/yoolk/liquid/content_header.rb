module Yoolk
  module Liquid
    class ContentHeader

      attr_reader :listing, :view_context, :seo

      def initialize(listing, view_context, seo)
        @listing      = listing
        @view_context = view_context
        @seo          = seo
      end

      def to_s
        [
          meta_base,
          meta_og,
          meta_twitter,
          meta_itemscope,
          csrf_meta_tags,
          google_analytics
        ].compact.join("\n")
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

      def meta_itemscope
        %Q{
          <meta content='#{listing.name}'        itemscope='name'>
          <meta content='#{seo.description}'     itemscope='description'>
          <meta content='#{seo.social_image}'    itemscope='image'>
        }
      end

      def meta_twitter
        %Q{
          <meta content='http://#{seo.social_url}/' name='twitter:url'>
          <meta content='#{seo.title}'              name='twitter:title'>
          <meta content='#{seo.description}'        name='twitter:description'>
          <meta content='#{seo.social_image}'       name='twitter:image'>
        }
      end

      def meta_og
        %Q{
          <meta content='#{seo.title}'               property='og:title'>
          <meta content='#{seo.description}'         property='og:description'>
          <meta content='website'                    property='og:type'>
          <meta content='#{seo.social_image}'        property='og:image'>
          <meta content='http://#{seo.social_url}/'  property='og:url'>
        }
      end

      def meta_base
        %Q{
          <meta charset='utf-8'>
          <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
          <meta content='#{seo.description}'                      name='description'>
          <meta content='#{seo.keywords}'                         name='keywords'>
          <meta content='width=device-width, initial-scale=1.0'   name='viewport'>
          <meta content='index, follow'                           name='robots'>
        }
      end

      private

        def google_analytics_key
          listing.instant_website.google_analytics_key.presence || 'UA-51188061-1'
        end
    end
  end
end