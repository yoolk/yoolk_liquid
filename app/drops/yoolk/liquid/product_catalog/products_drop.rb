module Yoolk
  module Liquid
    class ProductCatalog::ProductsDrop < ::Liquid::Rails::CollectionDrop
      scope :published, :storefronts

    end
  end
end