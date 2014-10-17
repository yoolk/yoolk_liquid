module Yoolk
  module Seo
    class Galleries::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.galleries')} - #{listing_name}"
      end

      def description
        "#{I18n.t(:'seo.photo_gallery_of')} #{listing.name}"
      end
    end
  end
end