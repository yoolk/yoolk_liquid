module Yoolk
  module Seo
    class Downloads::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.downloads')} - #{listing.name}"
      end

      def description
        # downloads
        "#{listing.links.first.try(:title)}, #{listing.links.first.description}"
      end
    end
  end
end