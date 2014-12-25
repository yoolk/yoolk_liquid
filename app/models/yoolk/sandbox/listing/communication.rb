module Yoolk
  module Sandbox
    class Listing::Communication < Base
      attribute :id,            String
      attribute :label,         String
      attribute :type,          String
      attribute :value,         String
      attribute :is_first_line, Boolean
      attribute :image_url,     String
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

      def fax?
        type.downcase.in? ['tel & fax', 'fax']
      end

      def facebook?
        type.downcase == 'facebook'
      end

      def twitter?
        type.downcase == 'twitter'
      end

      def address?
        type.downcase == 'address'
      end
    end
  end
end