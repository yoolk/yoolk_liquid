module Yoolk
  module Liquid
    class ProductCatalog::ProductsDrop < ::Liquid::Rails::CollectionDrop
      scope :storefronts

    end
  end
end