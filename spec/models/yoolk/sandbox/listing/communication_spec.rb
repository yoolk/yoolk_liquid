require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Communication do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :type attribute' do
        expect(described_class).to have_attribute(:type).of_type(String)
      end

      it 'has :value attribute' do
        expect(described_class).to have_attribute(:value).of_type(String)
      end

      it 'has :is_first_line attribute' do
        expect(described_class).to have_attribute(:is_first_line)
      end

      it 'has :image_url attribute' do
        expect(described_class).to have_attribute(:image_url).of_type(String)
      end
    end
  end
end