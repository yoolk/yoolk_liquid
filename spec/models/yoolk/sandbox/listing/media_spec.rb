require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::Media do

      it 'has :embed_script attribute' do
        expect(described_class).to have_attribute(:embed_script).of_type(String)
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
    end
  end
end