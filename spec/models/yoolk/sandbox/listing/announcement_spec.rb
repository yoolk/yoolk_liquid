require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Announcement do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(Integer)
      end

      it 'has :text attribute' do
        expect(described_class).to have_attribute(:text).of_type(String)
      end

      it 'has :image attribute' do
        expect(described_class).to have_attribute(:image).of_type(Hash)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end
    end
  end
end