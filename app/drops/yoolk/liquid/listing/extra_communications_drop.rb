module Yoolk
  module Liquid
    class Listing::ExtraCommunicationsDrop < ::Liquid::Rails::CollectionDrop
      scope :telephones, :emails, :websites
    end
  end
end