require 'rails_helper'

module Yoolk
  module Sandbox
    describe Portal, 'model' do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :abbreviation attribute' do
        expect(described_class).to have_attribute(:abbreviation).of_type(String)
      end

      it 'has :domain_name attribute' do
        expect(described_class).to have_attribute(:domain_name).of_type(String)
      end

      it 'has :description attribute' do
        expect(described_class).to have_attribute(:description).of_type(String)
      end

      it 'has :official_name attribute' do
        expect(described_class).to have_attribute(:official_name).of_type(String)
      end

      it 'has :keywords attribute' do
        expect(described_class).to have_attribute(:keywords).of_type(String)
      end

      it 'has :time_zone attribute' do
        expect(described_class).to have_attribute(:time_zone).of_type(String)
      end

      it 'has :listings_count attribute' do
        expect(described_class).to have_attribute(:listings_count).of_type(Integer)
      end

      it 'has :country attribute' do
        expect(described_class).to have_attribute(:country).of_type(Yoolk::Sandbox::Country)
      end

      it 'has :language attribute' do
        expect(described_class).to have_attribute(:language).of_type(Yoolk::Sandbox::Language)
      end
    end
  end
end