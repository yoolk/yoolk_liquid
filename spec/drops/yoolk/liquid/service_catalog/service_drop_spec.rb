require 'rails_helper'

module Yoolk
  module Liquid
    module ServiceCatalog
      describe ServiceDrop, 'model' do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:description) }
        it { should have_attribute(:properties) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }
        it { should have_attribute(:to_param) }

        it { should have_many(:photos).with('Yoolk::Liquid::AttachmentDrop') }
      end

      describe ServiceDrop, 'methods' do
        let(:category)  { Yoolk::Sandbox::ServiceCatalog::Category.new(id: 1, alias_id: 'kh1', name: 'Rentals') }
        let(:service)   { Yoolk::Sandbox::ServiceCatalog::Service.new(id: 1, name: 'Renting Service', category: category) }
        let(:drop)      { service.to_liquid }

        before          { setup_view_and_controller }

        it '#url' do
          drop.context = ::Liquid::Context.new({}, {}, { controller: controller })

          expect(drop.url).to eq('/services/kh1-rentals/1-renting-service')
        end
      end
    end
  end
end