require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CatalogItemsDrop do
      it { should have_scope(:published) }
      it { should have_scope(:with_images) }
    end
  end
end