module Yoolk
  module Seo
    class Links::Index < Yoolk::Seo::Base
      def title
        "#{ I18n.t(:'seo.links') } - #{ listing.name }"
      end

      def description
        "#{ listing.links.map(&:title).compact.to_sentence }"
      end
    end
  end
end