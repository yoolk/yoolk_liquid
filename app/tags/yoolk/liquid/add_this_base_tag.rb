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

      # http://robots.thoughtbot.com/custom-tags-in-liquid
      def unknown_tag(name, params, tokens)
        if name.in?(['facebook', 'twitter', 'g_plus', 'pinterest', 'counter'])
          handle_link_tag(name, params)
        else
          super
        end
      end

      # https://github.com/Shopify/liquid/issues/265
      def blank?
        false
      end

      def handle_link_tag(name, params)
        args = split_params(params).map { |args| args.gsub(/\"|\'/, '') }
        @networks << { name: name, url: args[0], size: args[1] }
      end

      def split_params(params)
        params.split(",").map(&:strip)
      end

      def link_builder
        @networks.inject('') do |links, option|
          name, url = option[:name], option[:url]
          case name
          when 'facebook'  then links.concat facebook_link(url)
          when 'twitter'   then links.concat twitter_link(url)
          when 'g_plus'    then links.concat g_plus_link(url)
          when 'pinterest' then links.concat pinterest_link(url)
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

      def facebook_link(url)
        h.content_tag(:a, embedded_svg(url, 'social-facebook'),  class: 'addthis_button_facebook')
      end

      def twitter_link(url)
        h.content_tag(:a, embedded_svg(url, 'social-twitter'),   class: 'addthis_button_twitter')
      end

      def g_plus_link(url)
        h.content_tag(:a, embedded_svg(url, 'social-g-plus'),    class: 'addthis_button_google_plusone_share')
      end
      
      def pinterest_link(url)
        h.content_tag(:a, embedded_svg(url, 'social-pinterest'), class: 'addthis_button_pinterest_share')
      end

      # https://robots.thoughtbot.com/organized-workflow-for-svg
      def embedded_svg(url, id)
        assets = Rails.application.assets
        file = assets.find_asset(url).body.force_encoding("UTF-8")

        doc = Nokogiri::HTML::DocumentFragment.parse file
        svg = doc.at_css "svg"
        
        svg["class"] = 'social-share-icon'
        svg["id"]    = id.presence
        
        view.raw(doc).html_safe.presence
      end

      def h
        @context.registers[:helper]
      end

      def view
        @context.registers[:view]
      end
    end
  end
end
