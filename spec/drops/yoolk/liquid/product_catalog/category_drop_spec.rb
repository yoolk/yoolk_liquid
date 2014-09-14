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
        let(:drop)      { described_class.new(double) }

        it '#url' do
          expect(drop).to receive(:products_category_url).with(drop)

          drop.url
        end
      end
    end
  end
end