module Yoolk
  module Liquid
    class Listing::CatalogItemsDrop < ::Liquid::Rails::CollectionDrop
      scope :published

    end
  end
end