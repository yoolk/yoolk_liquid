module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :uncategorized?, :to_param,
                    :created_at, :updated_at

        has_many    :products, with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'

        def url
          product_category_products_url(self)
        end

        def current?
          @context.registers[:controller].params[:category_id].to_i == object.id
        end
      end
    end
  end
end