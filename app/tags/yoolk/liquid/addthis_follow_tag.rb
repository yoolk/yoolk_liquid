module Yoolk
  module Liquid
    class AddThisFollowTag < AddThisBaseTag

      def render(context)
        super context
      end

      def unknown_tag(name, params, tokens)
        super name, params, tokens
      end

      private

        def facebook_link( option )
          opts = {
                   "addthis:userid" => facebook_page_name,
                   :class           => "addthis_button_facebook_follow"
                 }

          h.content_tag(:a, option[:url].present? ? image_tag( option ) : nil, opts)
        end

        def twitter_link( option )
          opts = {
                   "addthis:userid" => twitter_page_name,
                   :class           => "addthis_button_twitter_follow"
                 }

          h.content_tag(:a, option[:url].present? ? image_tag( option ) : nil, opts)
        end

        def facebook_page_name
          facebook_page_url.gsub(/^.*facebook.com\/(?:pages\/)?([^\/]*)(\/.*)?$/, '\1')
        end

        def facebook_page_url
          @context["listing.facebook_page.name"]
        end

        def twitter_page_name
          twitter_page_url.gsub(/^.*twitter.com\/([^\/]*)(\/.*)?$/, '\1')
        end

        def twitter_page_url
          @context["listing.twitter_account.url"]
        end
    end
  end
end

Liquid::Template.register_tag('addthis_follow', Yoolk::Liquid::AddThisFollowTag)