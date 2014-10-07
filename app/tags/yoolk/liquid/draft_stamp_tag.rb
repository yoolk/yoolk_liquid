module Yoolk
  module Liquid
    class DraftStampTag < ::Liquid::Tag
      Syntax = /(#{::Liquid::VariableSignature}+)/

      def initialize(tag_name, markup, options)
        super

        @variable_name = (markup =~ Syntax)? $1 : 'draft.png'
        unless @variable_name.match(/\.(png|jpg|gif)$/)
          raise ArgumentError, 'Invalid parameter\'s file extension.'
        end
      end

      def render(context)
        @context = context

        if draft_stamp?
          image = context.registers[:view].asset_url @variable_name
          context.registers[:view].image_tag(image, style: "position: absolute; top: 0; right: 0; z-index: 9999;")
        end
      end

    private
      def draft_stamp?
        !is_live? && current_domain.try(:type) != "subdomain"
      end

      def is_live?
        @context["listing"].instant_website.is_live
      end

      def current_domain
        domains = @context["listing"].instant_website.domains.select do |domain|
          domain.name == @context.registers[:controller].request.host
        end
        return nil if domains.nil?

        domains.first
      end

    end
  end
end

Liquid::Template.register_tag('draft_stamp', Yoolk::Liquid::DraftStampTag)