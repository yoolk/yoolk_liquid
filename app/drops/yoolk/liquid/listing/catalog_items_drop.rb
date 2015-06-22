module Yoolk
  module Liquid
    class Listing::CatalogItemsDrop < ::Liquid::Rails::CollectionDrop
      scope :published, :with_images
    end
  end
end