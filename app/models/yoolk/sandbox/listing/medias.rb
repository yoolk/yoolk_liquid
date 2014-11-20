module Yoolk
  module Sandbox
    class Listing::Medias < Collection
      def actives
        select{ |item| item.is_active }
      end
    end
  end
end