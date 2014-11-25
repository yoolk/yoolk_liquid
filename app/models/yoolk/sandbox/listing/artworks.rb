module Yoolk
  module Sandbox
    class Listing::Artworks < Collection
      def actives
        select{ |item| item.is_active }
      end
    end
  end
end