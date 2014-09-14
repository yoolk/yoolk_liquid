module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes :id, :name, :name_path, :to_param

        has_many :products, with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'

        def url
          products_category_url(self)
        end
      end
    end
  end
end