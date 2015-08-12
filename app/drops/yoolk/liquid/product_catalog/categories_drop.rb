module Yoolk
  module Liquid
    class ProductCatalog::CategoriesDrop < ::Liquid::Rails::CollectionDrop
      scope :defaults, :roots
    end
  end
end