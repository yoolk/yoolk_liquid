module Yoolk
  module Liquid
    module ProductCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :name, :uncategorized?, :to_param,
                    :created_at, :updated_at

        has_many    :products,          scope: :published,
                                        class_name: 'Yoolk::Liquid::ProductCatalog::ProductsDrop',
                                        with: 'Yoolk::Liquid::ProductCatalog::ProductDrop'
        belongs_to  :parent,            with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :children,          with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :siblings,          with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :self_and_siblings, scope: :defaults,
                                        with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop',
                                        class_name: 'Yoolk::Liquid::ProductCatalog::CategoriesDrop'

        def root?
          object.root?
        end

        def leaf?
          object.leaf?
        end

        def children?
          object.children?
        end

        def nochildren?
          !children?
        end

        def self_and_ancestors
          object.ancestors_and_self
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