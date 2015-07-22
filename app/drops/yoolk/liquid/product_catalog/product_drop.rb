module Yoolk
  module Liquid
    module ProductCatalog
      class ProductDrop < BaseDrop
        attributes  :id, :name, :price, :price_with_currency, :description, :delivery, :features, :brand, :to_param,
                    :created_at, :updated_at

        has_many    :product_categories,  with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :photos,              with: 'Yoolk::Liquid::AttachmentDrop'

        def url
          product_url(self)
        end

        def cover_photo
          photos[0]
        end

        def data_json
          {
            product: {
              id: id,
              name: name,
              price: price,
              url: url,
              image_url: cover_photo.url(:small)
            }
          }.to_json
        end
      end
    end
  end
end