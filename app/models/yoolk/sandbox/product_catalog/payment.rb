module Yoolk
  module Sandbox
    module ProductCatalog
      class Payment < Yoolk::Sandbox::Base

        attribute :id,                    Integer
        attribute :type,                  Integer
        attribute :name,                  String
        attribute :account_name,          String
        attribute :account_number,        String
        attribute :paypal_email,          String
        attribute :note,                  String
        attribute :fee,                   String
        attribute :created_at,            DateTime
        attribute :updated_at,            DateTime

      end
    end
  end
end