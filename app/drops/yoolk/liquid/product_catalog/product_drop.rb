module Yoolk
  module Liquid
    module ProductCatalog
      class ProductDrop < BaseDrop
        attributes  :id, :name, :price, :price_with_currency, :description, :delivery, :features, :brand, :to_param,
                    :created_at, :updated_at

        has_many    :categories,  with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :photos,      with: 'Yoolk::Liquid::AttachmentDrop'

        def url
          if products_category_url?
            product_with_category_url(self)
          else
            product_url(self)
          end
        end

        def cover_photo
          photos[0]
        end

        private

        def products_category_url?
          @context['request.products_category_url?']
        end
      end
    end
  end
end