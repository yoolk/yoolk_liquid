require 'rails_helper'

module Yoolk
  module Liquid
    module ProductCatalog
      describe ProductDrop, 'model' do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:price) }
        it { should have_attribute(:price_with_currency) }
        it { should have_attribute(:sale_price) }
        it { should have_attribute(:show_price) }
        it { should have_attribute(:sku) }
        it { should have_attribute(:storefront) }
        it { should have_attribute(:published) }
        it { should have_attribute(:tracked_inventory) }
        it { should have_attribute(:storefront_order) }
        it { should have_attribute(:quantity) }
        it { should have_attribute(:description) }
        it { should have_attribute(:delivery) }
        it { should have_attribute(:features) }
        it { should have_attribute(:brand) }
        it { should have_attribute(:to_param) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }

        it { should have_many(:product_categories).with('Yoolk::Liquid::ProductCatalog::CategoryDrop') }
        it { should have_many(:photos).with('Yoolk::Liquid::AttachmentDrop') }
      end

      describe ProductDrop, 'methods' do
        let(:drop)      { described_class.new(double) }

        it '#url' do
          expect(drop).to receive(:product_url).with(drop)
          drop.url
        end

        it '#cover_photo' do
          expect(drop).to respond_to(:cover_photo)
        end
      end
    end
  end
end