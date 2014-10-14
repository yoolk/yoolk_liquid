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
        subject { described_class.new(double(alias_id: 'kh11')) }

        it '#url' do
          expect(subject).to receive(:services_category_url).with(subject)

          subject.url
        end

        it '#current? returns true' do
          @context.registers[:controller].params[:category_id] = 'kh11-business-service'

          expect(subject.current?).to eq(true)
        end

        it '#current? returns false' do
          @context.registers[:controller].params[:category_id] = 'kh212-hotel-service'

          expect(subject.current?).to eq(false)
        end
      end
    end
  end
end