module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :to_param

        has_many    :products, with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'

        def url
          product_category_products_url(self)
        end

        def current?
          @context.registers[:controller].params[:category_id].to_i == object.id
        end

        def prefix_path
          "products-categories/#{to_param}"
        end
      end
    end
  end
end