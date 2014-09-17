module Yoolk
  module Liquid
    class Listing::PeopleDrop < ::Liquid::Rails::CollectionDrop
      scope :directors, :managers, :employees
    end
  end
end