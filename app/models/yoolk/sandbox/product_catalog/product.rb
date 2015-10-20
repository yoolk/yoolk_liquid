module Yoolk
  module Sandbox
    module ProductCatalog
      class Product < Yoolk::Sandbox::Base
        include ActionView::Helpers

        attribute :id,                  Integer
        attribute :name,                String
        attribute :price,               Float
        attribute :sale_price,          Float
        attribute :show_price,          Boolean
        attribute :sku,                 String
        attribute :storefront,          Boolean
        attribute :published,           Boolean
        attribute :tracked_inventory,   Boolean
        attribute :storefront_order,    Integer
        attribute :quantity,            Integer
        attribute :description,         String
        attribute :delivery,            Boolean
        attribute :features,            Array
        attribute :created_at,          DateTime
        attribute :updated_at,          DateTime

        attribute :brand,               Yoolk::Sandbox::ProductCatalog::Brand
        attribute :product_category_ids,Array
        attribute :photos,              Array[Yoolk::Sandbox::Attachment]
        attribute :listing,             Yoolk::Sandbox::Listing

        def to_param
          "#{id}-#{name.parameterize}"
        end

        def price_with_currency
          return if price.nil?
          number_to_currency(price, unit: listing.currency.code, format: '%u %n')
        end

        def product_categories
          listing.product_categories.select { |category| category.id.in?(product_category_ids) }
        end

        def discount_in_percentage

        end

        # TODO temporary fake, will remove when move to engines
        def to_json_ld
          'render correct json ld format'
        end
      end
    end
  end
end