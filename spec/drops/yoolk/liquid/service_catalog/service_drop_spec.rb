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
        let(:service)   { Yoolk::Sandbox::ServiceCatalog::Service.new(id: 1, name: 'Renting Service') }
        let(:drop)      { service.to_liquid }

        it '#url' do
          expect(drop).to receive(:service_url).with(drop)

          drop.url
        end
      end
    end
  end
end