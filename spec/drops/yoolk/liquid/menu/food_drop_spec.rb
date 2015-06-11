require 'rails_helper'

module Yoolk
  module Liquid
    module Menu
      describe FoodDrop, 'model' do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:price) }
        it { should have_attribute(:price_with_currency) }
        it { should have_attribute(:description) }
        it { should have_attribute(:properties) }
        it { should have_attribute(:delivery) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }
        it { should have_attribute(:to_param) }

        it { should have_many(:photos).with('Yoolk::Liquid::AttachmentDrop') }
      end

      describe FoodDrop, 'methods' do
        let(:drop)      { described_class.new(double) }

        it '#url' do
          expect(drop).to receive(:menu_url).with(drop)

          drop.url
        end

        it '#cover_photo' do
          expect(drop).to respond_to(:cover_photo)
        end
      end
    end
  end
end