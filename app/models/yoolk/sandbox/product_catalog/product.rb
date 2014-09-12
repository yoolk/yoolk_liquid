module Yoolk
  module Sandbox
    module ProductCatalog
      class Product < Yoolk::Sandbox::Base

        attribute :id,                String
        attribute :name,              String
        attribute :description,       String
        attribute :delivery,          Boolean
        attribute :created_at,        DateTime
        attribute :updated_at,        DateTime
        attribute :features,          Array

        attribute :brand,             Hash[Symbol=>String]
        attribute :photos,            Array[Yoolk::Sandbox::Attachment]
        attribute :category,          Yoolk::Sandbox::ProductCatalog::Category

        def to_param
          "#{id}-#{name.parameterize}"
        end
      end
    end
  end
end