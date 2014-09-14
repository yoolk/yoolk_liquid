module Yoolk
  module Sandbox
    module ProductCatalog
      class Category < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :name,                  String
        attribute :name_path,             String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

        attribute :products,              Array[Yoolk::Sandbox::ProductCatalog::Product]

        def to_param
          "#{id}-#{name.parameterize}"
        end
      end
    end
  end
end