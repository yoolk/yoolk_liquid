module Yoolk
  module Sandbox
    module ServiceCatalog
      class Service < Yoolk::Sandbox::Base
        include ActionView::Helpers

        attribute :id,            Integer
        attribute :name,          String
        attribute :price,         Float
        attribute :description,   String
        attribute :properties,    Array
        attribute :created_at,    DateTime
        attribute :updated_at,    DateTime

        attribute :photos,        Array[Yoolk::Sandbox::Attachment]
        attribute :category,      Yoolk::Sandbox::ServiceCatalog::Category
        attribute :listing,       Yoolk::Sandbox::Listing

        def to_param
          "#{id}-#{name.parameterize}"
        end

        def price_with_currency
          return if price.nil?
          number_to_currency(price, unit: listing.currency.code, format: '%u %n')
        end
      end
    end
  end
end