module Yoolk
  module Seo
    class Attachments::Index < Yoolk::Seo::Base
      def title
        "#{ I18n.t(:'seo.attachments') } - #{ listing.name }"
      end

      def description
        "#{ listing.attachments.map(&:name).compact.to_sentence }"
      end
    end
  end
end