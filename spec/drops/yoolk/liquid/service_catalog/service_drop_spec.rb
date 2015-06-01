require 'rails_helper'

module Yoolk
  module Liquid
    module ServiceCatalog
      describe ServiceDrop, 'model' do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:price) }
        it { should have_attribute(:price_with_currency) }
        it { should have_attribute(:description) }
        it { should have_attribute(:properties) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }
        it { should have_attribute(:to_param) }

        it { should have_many(:photos).with('Yoolk::Liquid::AttachmentDrop') }
      end

      describe ServiceDrop, 'methods' do
        let(:service)   { build(:service) }
        let(:drop)      { described_class.new(service) }

        it '#url' do
          expect(drop).to receive(:service_url).with(drop)

          drop.url
        end

        it '#cover_photo' do
          expect(drop).to respond_to(:cover_photo)
          expect(drop.cover_photo).to eq(drop.photos[0])
        end
      end
    end
  end
end