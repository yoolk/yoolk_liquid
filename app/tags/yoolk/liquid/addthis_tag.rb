module Yoolk
  module Liquid
    class AddThisTag < ::Liquid::Block
      attr_accessor :networks

      def initialize(tag_name, markup, options)
        super

        @tool, @style = markup.split(',').inject([]) do |props, item|
          props.push($1.delete("'")) if item =~ /('.*')/
        end

        @networks = []

        @style_size = case @style || 'small'
        when 'large'  then '32x32'
        when 'medium' then '20x20'
        when 'small'  then '16x16'
        else
          raise ArgumentError.new("Style must be one of large, medium, small")
        end

        unless @tool == 'follow'
          raise SyntaxError.new("Syntax Error - Valid syntax: {% addthis tool: 'follow' %}{% endaddthis %}")
        end
      end

      def unknown_tag(name, params, tokens)
        if name.in?(['facebook', 'twitter'])
          handle_link_tag(name, params)
        else
          super
        end
      end

      def blank?
        false
      end

      def handle_link_tag(name, params)
        args = split_params(params)

        url, size = args.inject([]) do |props, item|
          props.push($1.delete("'")) if item =~ /('.*')/
        end

        @networks << { name: name, url: url, size: size }
      end

      def split_params(params)
        params.split(",").map(&:strip)
      end

      def render(context)
        @context = context

        <<-EOF.gsub(/^\s+|$\n/, "")
          <div class="addthis_toolbox addthis_default_style addthis_#{ @style_size }_style">
          #{ link_builder }
          </div>
        EOF
      end

      def link_builder
        @networks.inject("") do |links, option|
          case option[:name]
          when 'facebook' then links.concat facebook_link( option )
          when 'twitter'  then links.concat twitter_link ( option )
          end
        end
      end

      private

        def image_tag option
          option[:size].present? ? h.image_tag(option[:url], size: option[:size]) : h.image_tag(option[:url])
        end

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

        def h
          @context.registers[:helper]
        end

        def facebook_page_name
          facebook_page_url.gsub(/^.*facebook.com\/(?:pages\/)?([^\/]*)(\/.*)?$/, '\1')
        end

        def facebook_page_url
          @context["listing.facebook_page.page_name"]
        end

        def twitter_page_name
          twitter_page_url.gsub(/^.*twitter.com\/([^\/]*)(\/.*)?$/, '\1')
        end

        def twitter_page_url
          @context["listing.twitter_account.profile_url"]
        end
    end
  end
end

Liquid::Template.register_tag('addthis', Yoolk::Liquid::AddThisTag)