require 'rails_helper'

module Yoolk
  module Liquid
    module ProductCatalog
      describe CategoryDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:name_path) }
        it { should have_attribute(:to_param) }

        it { should have_many(:products).with('Yoolk::Liquid::ProductCatalog::ProductDrop') }
      end

      describe CategoryDrop, 'methods' do
        subject { described_class.new(double(id: 33)) }

        it '#url' do
          expect(subject).to receive(:products_category_url).with(subject)

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