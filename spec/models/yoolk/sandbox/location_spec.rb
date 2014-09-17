require 'rails_helper'

module Yoolk
  module Sandbox
    describe Location do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :alias_id attribute' do
        expect(described_class).to have_attribute(:alias_id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :priority attribute' do
        expect(described_class).to have_attribute(:priority).of_type(Integer)
      end

      it 'has :show_on_web attribute' do
        expect(described_class).to have_attribute(:show_on_web)
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