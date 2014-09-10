require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :alias_id attribute' do
        expect(described_class).to have_attribute(:alias_id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :address attribute' do
        expect(described_class).to have_attribute(:address).of_type(String)
      end

      it 'has :lat attribute' do
        expect(described_class).to have_attribute(:lat).of_type(Float)
      end

      it 'has :long attribute' do
        expect(described_class).to have_attribute(:long).of_type(Float)
      end

      it 'has :zoom_level attribute' do
        expect(described_class).to have_attribute(:zoom_level).of_type(Integer)
      end

      it 'has :is_active attribute' do
        expect(described_class).to have_attribute(:is_active)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it 'has :location attribute' do
        expect(described_class).to have_attribute(:location).of_type(Yoolk::Sandbox::Location)
      end

      it 'has :country attribute' do
        expect(described_class).to have_attribute(:country).of_type(Yoolk::Sandbox::Country)
      end

      it 'has :communications attribute' do
        expect(described_class).to have_attribute(:communications).of_type(Array, member_type: Yoolk::Sandbox::Listing::Communication)
      end

      it 'has :extra_communications attribute' do
        expect(described_class).to have_attribute(:extra_communications).of_type(Array, member_type: Yoolk::Sandbox::Listing::ExtraCommunication)
      end

      it 'has :listing_categories attribute' do
        expect(described_class).to have_attribute(:listing_categories).of_type(Array, member_type: Yoolk::Sandbox::Listing::Category)
      end
    end
  end
end