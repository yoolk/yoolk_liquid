module Yoolk
  module Liquid
    module ProductCatalog
      class ProductDrop < BaseDrop
        attributes  :id, :name, :price, :sale_price, :quantity, :price_with_currency,
                    :description, :delivery, :features, :brand, :to_param, :hide_price,
                    :sku, :storefront, :published, :tracked_inventory, :storefront_order,
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

        def add_to_cart?
          sellable? and (quantity.to_i > 0)
        end
        alias_method :in_stock?, :add_to_cart?

        private

        def sellable?
          !hide_price && product_deliveries.present? && product_payments.present? && set_price?
        end

        def set_price?
          (sale_price || price).present?
        end

        def product_deliveries
          object.listing.product_deliveries
        end

        def product_payments
          object.listing.product_payments
        end
      end
    end
  end
end