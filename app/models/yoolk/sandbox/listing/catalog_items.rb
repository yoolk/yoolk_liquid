module Yoolk
  module Sandbox
    class Listing::CatalogItems < Collection
      def published
        select{ |item| item.published? }
      end
    end
  end
end