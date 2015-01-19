module Yoolk
  module Seo
    class Links::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.links')} - #{listing.name}"
      end

      def description
        "#{listing.links.first.try(:title)}, #{listing.links.first.description}"
      end
    end
  end
end