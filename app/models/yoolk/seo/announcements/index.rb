module Yoolk
  module Seo
    class Announcements::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'links.announcements')} - #{listing.name}"
      end
    end
  end
end