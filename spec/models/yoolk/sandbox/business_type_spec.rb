require 'rails_helper'

module Yoolk
  module Sandbox
    describe BusinessType do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :display_order attribute' do
        expect(described_class).to have_attribute(:display_order).of_type(String)
      end

      it 'has :group_number attribute' do
        expect(described_class).to have_attribute(:group_number).of_type(String)
      end
    end
  end
end