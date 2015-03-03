require 'rails_helper'

module Yoolk
  module Sandbox

    describe InstantWebsite::TemplatePage do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :display_order attribute' do
        expect(described_class).to have_attribute(:display_order).of_type(Integer)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

    end
  end
end