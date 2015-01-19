module Yoolk
  module Seo
    class Videos::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.videos')} - #{listing.name}"
      end

      def description
        # medias video
        "#{listing.links.first.try(:title)}, #{listing.links.first.description}"
      end
    end
  end
end