module Yoolk
  module Sandbox
    class Listing::ExtraCommunication < Base
      attribute :id,            String
      attribute :type,          String
      attribute :label,         String
      attribute :value,         String
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime

      def email?
        type.downcase == 'e-mail'
      end

      def website?
        type.downcase == 'website'
      end

      def telephone?
        type.downcase.in? ['tel', 'tel & fax', 'fax', 'mobile', 'mobile phone', 'toll free']
      end
    end
  end
end