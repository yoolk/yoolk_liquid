module Yoolk
  module Seo
    class Feedback::Index < Yoolk::Seo::Base
      def title
        "#{I18n.t(:'seo.feedback')} - #{listing.name}"
      end

      def description
        I18n.t(:'seo.feedback_quote')
      end
    end
  end
end