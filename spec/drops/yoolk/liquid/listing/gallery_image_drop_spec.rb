require 'rails_helper'

module Yoolk
  module Liquid
    describe Listing::GalleryImageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:caption) }
      it { should have_attribute(:display_order) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:gallery).class_name('Yoolk::Liquid::Listing::ImageGalleryDrop') }
    end

    describe Listing::GalleryImageDrop do
      subject { described_class.new(double) }

      it { should delegate(:styles).to(:object) }
      it { should delegate(:width).to(:object) }
      it { should delegate(:height).to(:object) }
      it { should delegate(:url).to(:object) }
    end
  end
end