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

        def to_param
          "#{id}-#{name.parameterize}"
        end

        def products
          @products ||= begin
            products = Yoolk::Sandbox::ProductCatalog::Product.find(product_ids)
            binding.pry if products.nil?
            products.each do |product|
              product.listing = listing
            end
          end
        end
      end
    end
  end
end