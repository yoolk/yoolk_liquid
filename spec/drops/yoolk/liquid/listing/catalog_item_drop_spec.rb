require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::CatalogItemDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:title) }
      it { should have_attribute(:html_text) }
      it { should have_attribute(:show_image) }
      it { should have_attribute(:published) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should have_attribute(:image) }
    end

    describe Listing::CatalogItemDrop do
      subject { described_class.new(double) }

      it { should delegate(:styles).to(:object) }
      it { should delegate(:width).to(:object) }
      it { should delegate(:height).to(:object) }
      it { should delegate(:url).to(:object) }
    end
  end
end