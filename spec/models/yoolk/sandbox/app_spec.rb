require 'rails_helper'

module Yoolk
  module Sandbox
    describe App do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(Integer)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end
    end
  end
end