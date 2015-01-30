module Yoolk
  module Liquid
    class Listing::LinkDrop < BaseDrop
      attributes  :id, :title, :link, :description,
                  :created_at, :updated_at

      def url
        link_url(self)
      end
    end
  end
end