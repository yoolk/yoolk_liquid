module Yoolk
  module Sandbox
    module ProductCatalog
      class Product < Yoolk::Sandbox::Base
        include ActionView::Helpers

        attribute :id,                Integer
        attribute :name,              String
        attribute :price,             Float
        attribute :description,       String
        attribute :delivery,          Boolean
        attribute :features,          Array
        attribute :created_at,        DateTime
        attribute :updated_at,        DateTime

        attribute :brand,             Yoolk::Sandbox::ProductCatalog::Brand
        attribute :product_categories,  Array[Yoolk::Sandbox::ProductCatalog::Category]
        attribute :photos,            Array[Yoolk::Sandbox::Attachment]
        attribute :listing,           Yoolk::Sandbox::Listing

        def to_param
          "#{id}-#{name.parameterize}"
        end

        def price_with_currency
          return if price.nil?
          number_to_currency(price, unit: listing.currency.code, format: '%u %n')
        end

        def product_categories
          result = []
          @product_categoies ||= listing.product_categories.each do |category|
            result << category if category.id.in? super.map(&:id)
          end
        end
      end
    end
  end
end