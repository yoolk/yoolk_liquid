require 'rails_helper'

module Yoolk
  module Sandbox
    describe Hour do

      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :hour attribute' do
        expect(described_class).to have_attribute(:hour).of_type(String)
      end

      it 'has :minute attribute' do
        expect(described_class).to have_attribute(:minute).of_type(String)
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