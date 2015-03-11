module Yoolk
  module Liquid
    class Listing::CommunicationsDrop < ::Liquid::Rails::CollectionDrop
      scope :telephones, :faxes, :emails, :websites

    end
  end
end