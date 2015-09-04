module Yoolk
  module Liquid
    class Listing::CommunicationsDrop < ::Liquid::Rails::CollectionDrop
      scope :telephones, :faxes, :emails, :websites, :telephones_and_faxes

    end
  end
end