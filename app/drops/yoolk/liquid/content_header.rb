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
          webclip_link,
          favicon_link,
          meta_itemscope,
          csrf_meta_tags,
          google_analytics,
          alternate_link,
          business_view_js,
          canonical_link,
        ].compact.join("\n")
      end

      def canonical_link
        if view_context.controller_path.start_with?('products') && request.params["id"]
          %{
            <link rel="canonical" href="#{view_context.product_category_product_url(nil, seo.object)}" />
          }
        end
      end

      def alternate_link
        if listing.to_liquid.multilinguals.present?
          listing.to_liquid.multilinguals.inject('') do |result, listing|
            "<link href='#{ listing.instant_website.primary_domain.url }' hreflang='#{ listing.language.two_code }' rel='alternate' />"
          end
        end
      end

      def csrf_meta_tags
        view_context.csrf_meta_tags
      end

      def google_analytics
        if Rails.env.production? && !listing.portal.labs? && !view_context.preview_mode?
          %{
          <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', '#{google_analytics_key}', '#{request.host}');

          #{
            if owner_google_analytics_key.present?
             [
               "ga('create', '#{owner_google_analytics_key}', '#{request.host}', {'name': 'ownerTracker'});",
               "ga('ownerTracker.send', 'pageview');"
             ].join("\n")
            end
          }

          ga('send', 'pageview');

          </script>
          }
        else
          nil
        end
      end

      def meta_itemscope
        %Q{
          <meta content='#{listing.name}'        itemscope='name'>
          <meta content='#{CGI.escapeHTML(seo.description)}'     itemscope='description'>
          <meta content='#{seo.social_image}'    itemscope='image'>
        }
      end

      def meta_twitter
        %Q{
          <meta content='http://#{seo.social_url}/'           name='twitter:url'>
          <meta content='#{CGI.escapeHTML(seo.title)}'        name='twitter:title'>
          <meta content='#{CGI.escapeHTML(seo.description)}'  name='twitter:description'>
          <meta content='#{seo.social_image}'                 name='twitter:image'>
        }
      end

      def meta_og
        %Q{
          <meta content='#{CGI.escapeHTML(seo.title)}'        property='og:title'>
          <meta content='#{CGI.escapeHTML(seo.description)}'  property='og:description'>
          <meta content='website'                             property='og:type'>
          <meta content='#{seo.social_image}'                 property='og:image'>
          <meta content='http://#{seo.social_url}/'           property='og:url'>
        }
      end

      def meta_base
        %Q{
          <title>#{CGI.escapeHTML(seo.title)}</title>

          <meta charset='utf-8'>
          <meta content='IE=edge,chrome=1' http-equiv='X-UA-Compatible'>
          <meta content='#{CGI.escapeHTML(seo.description)}'                         name='description'>
          <meta content='#{seo.keywords}'                                            name='keywords'>
          <meta content='width=device-width, initial-scale=1.0'                      name='viewport'>
          <meta content="#{ preview_mode? ? 'noindex, nofollow' : 'index, follow' }" name='robots'>
        }
      end

      def business_view_js
        %Q{
          #{ view_context.javascript_include_tag 'yoolk/jquery.business-view-overlay.js' }
          <script type="text/javascript">
            window.addEventListener("load", function() {
              $('body').data('api-url', "#{ENV['API_URL']}");
            });
          </script>
        }
      end

      def favicon_link
        if listing.instant_website.try(:favicon).present?
          view_context.favicon_link_tag listing.instant_website.favicon.url
        end
      end

      def webclip_link
        if listing.instant_website.try(:webclip).present?
          %Q{ <link rel='apple-touch-icon' href='#{listing.instant_website.webclip.url}' /> }
        end
      end

      private

        def request
          view_context.request
        end

        def preview_mode?
          request.host.in?(['iw.yoolk.com', 'iwstaging.yoolk.com', 'localhost']) && request.params[:alias_id].present?
        end

        def google_analytics_key
          listing.instant_website.try(:google_analytics_key).presence || 'UA-51188061-1'
        end

        def owner_google_analytics_key
          listing.instant_website.owner_google_analytics_key
        end
    end
  end
end
