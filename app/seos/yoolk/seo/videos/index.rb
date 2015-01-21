module Yoolk
  module Seo
    class Videos::Index < Yoolk::Seo::Base
      def title
        "#{ I18n.t(:'seo.videos') } - #{ listing.name }"
      end

      def description
        "#{ listing.medias.map(&:title).compact.to_sentence }"
      end
    end
  end
end