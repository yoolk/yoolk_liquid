require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::ShortDescription do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :text attribute' do
        expect(described_class).to have_attribute(:text).of_type(String)
      end

      it 'has :categories attribute' do
        expect(described_class).to have_attribute(:categories).of_type(Array, member_type: Yoolk::Sandbox::Listing::Category)
      end
    end
  end
end