require 'rails_helper'

module Yoolk
  module Sandbox
    describe PositionLevel do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :sort_order attribute' do
        expect(described_class).to have_attribute(:sort_order).of_type(Integer)
      end
    end
  end
end