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

        def facebook_link(option)
          opts = {
                   "addthis:userid" => facebook_page_username,
                   :class           => "addthis_button_facebook_follow"
                 }

          h.content_tag(:a, option[:url].present? ? image_tag( option ) : nil, opts)
        end

        def twitter_link(option)
          opts = {
                   "addthis:userid" => twitter_username,
                   :class           => "addthis_button_twitter_follow"
                 }

          h.content_tag(:a, option[:url].present? ? image_tag( option ) : nil, opts)
        end

        def facebook_page_username
          @context['listing.facebook_page.username']
        end

        def twitter_username
          @context['listing.twitter_account.username']
        end
    end
  end
end

Liquid::Template.register_tag('addthis_follow', Yoolk::Liquid::AddThisFollowTag)