require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Link do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(Integer)
      end

      it 'has :title attribute' do
        expect(described_class).to have_attribute(:title).of_type(String)
      end

      it 'has :link attribute' do
        expect(described_class).to have_attribute(:link).of_type(String)
      end

      it 'has :description attribute' do
        expect(described_class).to have_attribute(:description).of_type(String)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

      it { should respond_to(:to_param) }
    end
  end
end