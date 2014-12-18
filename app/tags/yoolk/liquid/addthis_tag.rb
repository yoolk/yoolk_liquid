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
        @style_size = case @style
        when 'large'
          '32x32'
        when 'medium'
          '20x20'
        when 'small'
          '16x16'
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

        # binding.pry
        # super.concat("<input>&&&</input>")
        # '<input>&&&</input>'
      end

      # check image, addthis size style
      def link_builder
        @networks.inject("") do |links, li|
          case li[:name]
          when 'facebook'
            links.concat(h.link_to "", "", {"addthis-userid" => facebook_page_name(@context["listing.facebook_page.page_name"]), :class=> "addthis_button_facebook_follow"})
          when 'twitter'
            links.concat(h.link_to "", "", {"addthis-userid" => twitter_page_name(@context["listing.twitter_account.profile_url"]), :class=> "addthis_button_twitter_follow"})
          end
        end
      end

      private
        def h
          @context.registers[:helper]
        end

        def facebook_page_name(url)
          url.gsub(/^.*facebook.com\/(?:pages\/)?([^\/]*)(\/.*)?$/, '\1')
        end

        def twitter_page_name(url)
          url.gsub(/^.*twitter.com\/([^\/]*)(\/.*)?$/, '\1')
        end

    end
  end
end

Liquid::Template.register_tag('addthis', Yoolk::Liquid::AddThisTag)