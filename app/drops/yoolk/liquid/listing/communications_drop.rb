module Yoolk
  module Liquid
    class Listing::CommunicationsDrop < ::Liquid::Rails::CollectionDrop
      # scope :emails

      def emails
        self.class.new communications.select{|com| com.type.downcase == 'e-mail'}
      end

      def communications
        objects
      end
    end
  end
end