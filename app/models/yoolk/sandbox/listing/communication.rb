module Yoolk
  module Sandbox
    class Listing::Communication < Base
      attribute :id,            String
      attribute :type,          String
      attribute :value,         String
      attribute :is_first_line, Boolean
      attribute :image_url,     String
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime

      def email?
        type_downcase == 'e-mail'
      end

      def website?
        type_downcase == 'website'
      end

      def telephone?
        type_downcase.in? ['tel', 'tel & fax', 'fax', 'mobile', 'mobile phone', 'toll free']
      end
    end
  end
end