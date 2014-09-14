require 'rails_helper'

module Yoolk
  module Liquid
    module ServiceCatalog
      describe CategoryDrop do
        it { should have_attribute(:id) }
        it { should have_attribute(:alias_id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:short_name) }
        it { should have_attribute(:description) }
        it { should have_attribute(:to_param) }

        it { should have_many(:services).with('Yoolk::Liquid::ServiceCatalog::ServiceDrop') }
      end

      describe CategoryDrop, 'methods' do
        let(:drop)      { described_class.new(double) }

        it '#url' do
          expect(drop).to receive(:services_category_url).with(drop)

          drop.url
        end
      end
    end
  end
end