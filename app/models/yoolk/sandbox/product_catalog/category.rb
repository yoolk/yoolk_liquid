module Yoolk
  module Sandbox
    module ProductCatalog
      class Category < Yoolk::Sandbox::Base

        attribute :id,                    String
        attribute :name,                  String
        attribute :name_path,             String
        attribute :products,              Array[Yoolk::Sandbox::ProductCatalog::Product]
      end
    end
  end
end