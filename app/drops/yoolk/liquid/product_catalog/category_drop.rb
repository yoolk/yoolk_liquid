module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :uncategorized?, :to_param, :lft, :rgt,
                    :created_at, :updated_at

        has_many    :products,          scope: :defaults,
                                        class_name: 'Yoolk::Liquid::ProductCatalog::ProductsDrop',
                                        with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'
        belongs_to  :parent,            with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :children,          scope: :defaults,
                                        with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop',
                                        class_name: 'Yoolk::Liquid::ProductCatalog::CategoriesDrop'
        has_many    :siblings,          scope: :defaults,
                                        with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop',
                                        class_name: 'Yoolk::Liquid::ProductCatalog::CategoriesDrop'
        has_many    :self_and_siblings, scope: :defaults,
                                        with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop',
                                        class_name: 'Yoolk::Liquid::ProductCatalog::CategoriesDrop'
        has_many    :self_and_ancestors, scope: :defaults,
                                        with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop',
                                        class_name: 'Yoolk::Liquid::ProductCatalog::CategoriesDrop'

        def root?
          object.root?
        end

        def leaf?
          object.leaf?
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