require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::ImageGalleryDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:to_param) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should have_many(:images).with('Yoolk::Liquid::Listing::GalleryImageDrop') }
    end

    describe Listing::ImageGalleryDrop, 'methods' do
      let(:drop)      { described_class.new(double) }

      it '#url' do
        expect(drop).to receive(:gallery_url).with(drop)

        drop.url
      end
    end
  end
end