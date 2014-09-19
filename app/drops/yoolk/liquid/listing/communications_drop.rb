module Yoolk
  module Liquid
    class Listing::CommunicationsDrop < ::Liquid::Rails::CollectionDrop
      scope :telephones, :emails, :websites

    end
  end
end