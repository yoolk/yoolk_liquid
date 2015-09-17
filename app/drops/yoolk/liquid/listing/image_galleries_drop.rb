module Yoolk
  module Liquid
    class Listing::ImageGalleriesDrop < ::Liquid::Rails::CollectionDrop
      scope :with_images
    end
  end
end