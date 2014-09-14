require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::ImageGallery do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(Integer)
      end

      it 'has :uuid attribute' do
        expect(described_class).to have_attribute(:uuid).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :display_order attribute' do
        expect(described_class).to have_attribute(:display_order).of_type(Integer)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'has :gallery_images attribute' do
        expect(described_class).to have_attribute(:gallery_images).of_type(Array, member_type: Yoolk::Sandbox::Listing::GalleryImage)
      end

      it { should respond_to(:to_param) }
      it { should alias_from(:gallery_images).to(:images) }
    end
  end
end