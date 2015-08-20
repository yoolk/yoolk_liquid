module Yoolk
  module Sandbox
    module ProductCatalog
      class Category < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :name,                  String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :product_ids,           Array
        attribute :listing,               Yoolk::Sandbox::Listing

        def uncategorized?
          name == 'Uncategorized'
        end

        def self_and_ancestors
          []
        end

        def products
          @products ||= begin
            products = Yoolk::Sandbox::ProductCatalog::Product.find(product_ids)
            products.each do |product|
              product.listing = listing
            end
          end
        end

        def to_param
          "#{id}-#{name.parameterize}"
        end
      end
    end
  end
end