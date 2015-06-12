require 'rails_helper'

module Yoolk
  module Liquid
    module ProductCatalog
      describe CategoryDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:to_param) }

        it { should have_many(:products).with('Yoolk::Liquid::ProductCatalog::ProductDrop') }
        it { should respond_to(:prefix_path) }
      end

      describe CategoryDrop, 'methods' do
        subject { described_class.new(double(id: 33)) }

        it '#url' do
          expect(subject).to receive(:product_category_products_url).with(subject)

          subject.url
        end

        it '#current? returns true' do
          @context.registers[:controller].params[:category_id] = '33-vehicle'

          expect(subject.current?).to eq(true)
        end

        it '#current? returns false' do
          @context.registers[:controller].params[:category_id] = '112-furniture'

          expect(subject.current?).to eq(false)
        end

        it '#prefix_path' do
          drop = build(:product_category, id: 1, name: 'ice cream').to_liquid

          expect(drop.prefix_path).to eq('products-categories/1-ice-cream')
        end
      end
    end
  end
end