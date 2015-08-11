module Yoolk
  module Liquid
    module ProductCatalog
      class PaymentDrop < BaseDrop
        attributes :id, :type, :name, :account_name, :account_number,
                   :paypal_email, :note, :fee,
                   :created_at, :updated_at

      end
    end
  end
end