module Yoolk
  module Seo
    class Services::Show < Yoolk::Seo::Base
      def title
        "#{service.name} - #{listing.name}"
      end
      def description
        "#{service.description.to_s.gsub(/<\/?[a-z][^>]*>/, " ").squeeze(" ").strip}"
      end
      def service
        object
      end
    end
  end
end