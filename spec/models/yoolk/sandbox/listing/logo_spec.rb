require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Logo do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'has :image attribute' do
        expect(described_class).to have_attribute(:image).of_type(Yoolk::Sandbox::Attachment)
      end

      it { should delegate(:styles).to(:image) }
      it { should delegate(:width).to(:image) }
      it { should delegate(:height).to(:image) }
      it { should delegate(:size).to(:image) }
      it { should delegate(:url).to(:image) }
    end
  end
end