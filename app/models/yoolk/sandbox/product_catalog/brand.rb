module Yoolk
  module Sandbox
    module ProductCatalog
      class Brand < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :name,                  String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

      end
    end
  end
end