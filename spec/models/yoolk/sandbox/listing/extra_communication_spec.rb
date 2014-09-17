require 'rails_helper'

module Yoolk
  module Sandbox
    describe Listing::ExtraCommunication do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :type attribute' do
        expect(described_class).to have_attribute(:type).of_type(String)
      end

      it 'has :label attribute' do
        expect(described_class).to have_attribute(:label).of_type(String)
      end

      it 'has :value attribute' do
        expect(described_class).to have_attribute(:value).of_type(String)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end
    end

    describe Listing::ExtraCommunication do
      it { should respond_to(:email?) }
      it { should respond_to(:website?) }
      it { should respond_to(:telephone?) }
    end
  end
end