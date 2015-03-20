module Yoolk
  module Sandbox
    module ProductCatalog
      class Product < Yoolk::Sandbox::Base

        attribute :id,                Integer
        attribute :name,              String
        attribute :price,             Float
        attribute :description,       String
        attribute :delivery,          Boolean
        attribute :features,          Array
        attribute :created_at,        DateTime
        attribute :updated_at,        DateTime

        attribute :brand,             Yoolk::Sandbox::ProductCatalog::Brand
        attribute :category,          Yoolk::Sandbox::ProductCatalog::Category
        attribute :photos,            Array[Yoolk::Sandbox::Attachment]

        def to_param
          "#{id}-#{name.parameterize}"
        end
      end
    end
  end
end