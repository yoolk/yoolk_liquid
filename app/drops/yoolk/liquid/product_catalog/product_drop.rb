module Yoolk
  module Liquid
    module ProductCatalog
      class ProductDrop < BaseDrop
        attributes  :id, :name, :price, :sale_price, :quantity, :price_with_currency,
                    :description, :delivery, :features, :brand, :to_param, :hide_price,
                    :sku, :storefront, :published, :tracked_inventory, :storefront_order,
                    :selling_price, :in_stock?, :out_of_stock?, :unlimited?,
                    :created_at, :updated_at

        has_many    :product_categories,  with: 'Yoolk::Liquid::ProductCatalog::CategoryDrop'
        has_many    :photos,              with: 'Yoolk::Liquid::AttachmentDrop'

        ## Delegates
        delegate    :add_to_cart?, :available_for_sale?, to: :object

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
              price: selling_price,
              url: url,
              image_url: cover_photo.url(:small)
            }
          }.to_json
        end

        def show_price?
          true
        end
      end
    end
  end
end
