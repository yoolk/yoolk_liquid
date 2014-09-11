module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes :id, :name, :name_path

        has_many :products, with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'
      end
    end
  end
end