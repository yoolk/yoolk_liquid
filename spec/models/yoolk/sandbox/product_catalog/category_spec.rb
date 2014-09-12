require 'rails_helper'

module Yoolk
  module Sandbox
    module ProductCatalog
      describe Category do
        it 'has :id attribute' do
          expect(described_class).to have_attribute(:id).of_type(String)
        end

        it 'has :name attribute' do
          expect(described_class).to have_attribute(:name).of_type(String)
        end

        it 'has :name_path attribute' do
          expect(described_class).to have_attribute(:name_path).of_type(String)
        end

        it 'has :products attribute' do
          expect(described_class).to have_attribute(:products).of_type(Array, member_type: Yoolk::Sandbox::ProductCatalog::Product)
        end
      end
    end
  end
end