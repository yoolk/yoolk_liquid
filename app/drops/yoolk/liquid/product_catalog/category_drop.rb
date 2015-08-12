module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :uncategorized?, :to_param,
                    :created_at, :updated_at

        has_many    :products, with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'
        belongs_to  :parent,   with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :children, with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :siblings, with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'

        def root?
          object.root?
        end

        def leaf?
          object.leaf?
        end

        def self_and_siblings
          object.siblings_and_self
        end

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