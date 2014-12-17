module Yoolk
  module Liquid
    class AddThisTag < ::Liquid::Block
      Syntax = /(#{::Liquid::VariableSignature}+)/
      attr_accessor :networks

      def initialize(tag_name, markup, options)
        super

        @networks = []
        if markup =~ Syntax
          @variable_name = $1
          unless @variable_name == 'follow'
            raise SyntaxError.new("Syntax Error - Valid syntax: {% addthis 'follow' %}")
          end
        end
      end

      def unknown_tag(name, params, tokens)
        if name.in?(['facebook', 'twitter'])
          handle_link_tag(params)
        else
          super
        end
      end

      def handle_link_tag(params)
        args = split_params(params)
        url, size = args.inject([]) do |props, item|
          props.push($1.delete("\"")) if item =~ /(".*")/
        end
        @networks << { url: url, size: size }
      end

      def split_params(params)
        params.split(",").map(&:strip)
      end

      def render(context)
        @context = context

        <<-EOF.gsub(/^\s+|$\n/, "")
          <div class="addthis_toolbox addthis_default_style addthis_32x32_style">
          #{ link_builder }
          </div>
        EOF

      end

      # check image, addthis size style
      def link_builder
        @networks.inject("") do |links, li|
          links.concat(h.link_to "", "", {"addthis-userid" => facebook_page_name(@context["listing.facebook_page.page_name"]), :class=> "addthis_button_facebook_follow"}) if @context["listing.facebook_page"]
          links.concat(h.link_to "", "", {"addthis-userid" => twitter_page_name(@context["listing.twitter_account.profile_url"]), :class=> "addthis_button_facebook_follow"}) if @context["listing.twitter_account"]
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