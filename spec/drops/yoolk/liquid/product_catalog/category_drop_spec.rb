require 'rails_helper'

module Yoolk
  module Liquid
    module ProductCatalog
      describe CategoryDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:to_param) }

        it { should belongs_to(:parent).with('Yoolk::Liquid::ProductCatalog::CategoryDrop') }
        it { should have_many(:products).with('Yoolk::Liquid::ProductCatalog::ProductDrop') }
        it { should have_many(:siblings).with('Yoolk::Liquid::ProductCatalog::CategoryDrop') }
        it { should have_many(:self_and_siblings).with('Yoolk::Liquid::ProductCatalog::CategoryDrop').class_name('Yoolk::Liquid::ProductCatalog::CategoriesDrop').scope(:defaults) }

        it { should respond_to(:root?) }
        it { should respond_to(:leaf?) }
        it { should respond_to(:self_and_siblings) }
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
      end
    end
  end
end