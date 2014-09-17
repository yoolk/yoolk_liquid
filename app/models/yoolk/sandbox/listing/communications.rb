module Yoolk
  module Sandbox
    class Listing::Communications < Collection
      def emails
        select { |item| item.type.downcase == 'e-mail' }
      end

      def websites
        select { |item| item.type.downcase == 'website' }
      end

      def telephones
        select { |item| item.type.downcase.in?(['tel', 'tel & fax', 'fax', 'mobile', 'mobile phone', 'toll free']) }
      end
    end
  end
end