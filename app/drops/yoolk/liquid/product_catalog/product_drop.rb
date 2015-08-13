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
              price: sellable_price,
              url: url,
              image_url: cover_photo.url(:small)
            }
          }.to_json
        end

        def show_price?
          true
        end

        def add_to_cart?
          has_quantity = quantity.nil? ? true : quantity.to_i > 0

          sellable? and has_quantity
        end
        alias_method :in_stock?, :add_to_cart?

        def out_of_stock?
          sellable? and quantity.to_i == 0 unless quantity.nil?
        end

        private

        def sellable?
          !hide_price && product_deliveries.present? && product_payments.present? && has_price?
        end

        def has_price?
          (sale_price || price).present?
        end

        def sellable_price
          sale_price.presence || price
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