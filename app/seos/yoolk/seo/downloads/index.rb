module Yoolk
  module Seo
    class Downloads::Index < Yoolk::Seo::Base
      def title
        "#{ I18n.t(:'seo.downloads') } - #{ listing.name }"
      end

      def description
        "#{ listing.attachments.map(&:name).compact.to_sentence }"
      end
    end
  end
end