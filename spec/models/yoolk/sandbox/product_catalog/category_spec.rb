require 'rails_helper'

module Yoolk
  module Sandbox
    module ProductCatalog
      describe Category do
        it 'has :id attribute' do
          expect(described_class).to have_attribute(:id).of_type(Integer)
        end

        it 'has :name attribute' do
          expect(described_class).to have_attribute(:name).of_type(String)
        end

        it 'has :created_at attribute' do
          expect(described_class).to have_attribute(:created_at).of_type(DateTime)
        end

        it 'has :updated_at attribute' do
          expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
        end

        it 'has :product_ids attribute' do
          expect(described_class).to have_attribute(:product_ids).of_type(Array)
        end

        it 'has :listing attribute' do
          expect(described_class).to have_attribute(:listing).of_type(Yoolk::Sandbox::Listing)
        end

        it { should respond_to(:uncategorized?) }
        it { should respond_to(:products) }
        it { should respond_to(:to_param) }
      end

      context 'methods' do
        it '#products' do
          category = build(:product_category, product_ids: [1], listing: build(:listing))

          expect(category.products.count).to eq(1)
          expect(category.products).to all(be_a(Yoolk::Sandbox::ProductCatalog::Product))
          expect(category.products.first.name).to eq('SANDSTORM 001')
          expect(category.products.first.listing.name).to eq('Yellow Tower inc.')
        end
      end
    end
  end
end