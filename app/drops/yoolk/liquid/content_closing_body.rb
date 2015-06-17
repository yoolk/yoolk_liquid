module Yoolk
  module Liquid
    class ContentClosingBody
      attr_reader :listing, :view_context

      def initialize(listing, view_context)
        @listing      = listing
        @view_context = view_context
      end

      def to_s
        [
          google_remarketing_tag,
          google_conversion_tag
        ].compact.join("\n")
      end


      private

      def google_conversion_tag
        if !preview_mode? && instant_website.present? && contact_us_posted_successfully?
          instant_website.google_conversion_tag
        end
      end

      def google_remarketing_tag
        if !preview_mode? && instant_website.try(:google_remarketing_tag).present?
          instant_website.google_remarketing_tag
        end
      end

      def instant_website
        listing.instant_website
      end

      def preview_mode?
        view_context.preview_mode?
      end

      def contact_us_posted_successfully?
        controller_name == 'contact_us' && flash.notice.present?
      end

      def controller_name
        view_context.controller.controller_name
      end

      def flash
        view_context.flash
      end

    end
  end
end
