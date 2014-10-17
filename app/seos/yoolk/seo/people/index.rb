module Yoolk
  module Seo
    class People::Index < Yoolk::Seo::Base
      def title
        "People - #{listing.name}"
      end

      def description
        "Public contact information of people who work for #{listing.name} that may want to contact by phone number or email address."
      end
    end
  end
end