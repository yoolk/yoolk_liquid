module Yoolk
  module Liquid
    class GoogleRemarketingTag < ::Liquid::Tag

      def initialize(tag_name, markup, options)
        super
      end

      def render(context)
        @context = context
        if !preview_mode? && instant_website.try(:google_remarketing_tag).present?
          instant_website.google_remarketing_tag
        end
      end

      private

      def preview_mode?
        @context['request']['preview_mode?']
      end

      def instant_website
        @context['listing'].instant_website
      end
    end
  end
end

Liquid::Template.register_tag('google_remarketing_tag', Yoolk::Liquid::GoogleRemarketingTag)
