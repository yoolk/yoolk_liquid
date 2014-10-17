module Yoolk
  module Seo
    class Announcements::Show < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.announcements_on')} #{I18n.localize(announcement.created_at, format: :long)} - #{listing.name}"
      end

      def description
        "#{announcement.text.gsub(/<\/?[a-z][^>]*>/, ' ').squeeze(' ').strip}"
      end

      def announcement
        object
      end
    end
  end
end