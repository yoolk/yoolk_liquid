module Yoolk
  module Liquid
    class AddThisBaseTag < ::Liquid::Block
      Syntax = /(style)\s*:+\s*'\s*(large|medium|small)\s*'|^\s*$/i
      attr_accessor :networks

      def initialize(tag_name, markup, options)
        super

        @networks = []
        if Syntax =~ markup
          @style_size = case $2 || 'small'
          when 'large'  then '32x32'
          when 'medium' then '20x20'
          when 'small'  then '16x16'
          end
        else
          raise SyntaxError.new("Syntax Error in tag '#{ tag_name }' - Valid syntax: {% #{ tag_name } style: 'large' %}")
        end
      end

      def unknown_tag(name, params, tokens)
        if name.in?(['facebook', 'twitter', 'counter'])
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

      def link_builder
        @networks.inject("") do |links, option|
          case option[:name]
          when 'facebook' then links.concat facebook_link( option )
          when 'twitter'  then links.concat twitter_link ( option )
          when 'counter'  then links.concat addthis_counter
          end
        end
      end

      def render(context)
        @context = context
        <<-EOF.gsub(/^\s+|$\n/, "")
          <div class="addthis_toolbox addthis_default_style addthis_#{ @style_size }_style">
          #{ link_builder }
          </div>
        EOF
      end

      private

        def image_tag option
          option[:size].present? ? h.image_tag(option[:url], size: option[:size]) : h.image_tag(option[:url])
        end

        def facebook_link( option )
          opts = {
                   :class   => "addthis_button_facebook"
                 }

          h.content_tag(:a, option[:url].present? ? image_tag( option ) : nil, opts)
        end

        def twitter_link( option )
          opts = {
                   :class   => "addthis_button_twitter"
                 }

          h.content_tag(:a, option[:url].present? ? image_tag( option ) : nil, opts)
        end

        def addthis_counter
          "<a class='addthis_counter addthis_bubble_style'></a>"
        end

        def h
          @context.registers[:helper]
        end

    end
  end
end