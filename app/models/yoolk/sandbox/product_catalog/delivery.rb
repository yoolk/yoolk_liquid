module Yoolk
  module Sandbox
    module ProductCatalog
      class Delivery < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :type,                  Integer
        attribute :name,                  String
        attribute :description,           String
        attribute :fee,                   String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

      end
    end
  end
end
