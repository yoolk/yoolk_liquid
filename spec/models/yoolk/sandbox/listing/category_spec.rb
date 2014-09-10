require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Category do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :alias_id attribute' do
        expect(described_class).to have_attribute(:alias_id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :short_name attribute' do
        expect(described_class).to have_attribute(:short_name).of_type(String)
      end

      it 'has :keyword attribute' do
        expect(described_class).to have_attribute(:keyword).of_type(String)
      end

      it 'has :description attribute' do
        expect(described_class).to have_attribute(:description).of_type(String)
      end

      it 'has :display_on_web attribute' do
        expect(described_class).to have_attribute(:display_on_web)
      end

      it 'has :listings_count attribute' do
        expect(described_class).to have_attribute(:listings_count).of_type(Integer)
      end

      it 'has :sub_categories_count attribute' do
        expect(described_class).to have_attribute(:sub_categories_count).of_type(Integer)
      end

      it 'has :level attribute' do
        expect(described_class).to have_attribute(:level).of_type(Integer)
      end

      it 'has :short_description attribute' do
        expect(described_class).to have_attribute(:short_description).of_type(Yoolk::Sandbox::Listing::ShortDescription)
      end
    end
  end
end