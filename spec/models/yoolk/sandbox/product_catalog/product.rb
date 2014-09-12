require 'rails_helper'

module Yoolk
  module Sandbox
    module ProductCatalog
      describe Product do
        it 'has :id attribute' do
          expect(described_class).to have_attribute(:id).of_type(String)
        end

        it 'has :name attribute' do
          expect(described_class).to have_attribute(:name).of_type(String)
        end

        it 'has :description attribute' do
          expect(described_class).to have_attribute(:description).of_type(String)
        end

        it 'has :delivery attribute' do
          expect(described_class).to have_attribute(:delivery).of_type(Boolean)
        end

        it 'has :created_at attribute' do
          expect(described_class).to have_attribute(:created_at).of_type(DateTime)
        end

        it 'has :updated_at attribute' do
          expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
        end

        it 'has :features attribute' do
          expect(described_class).to have_attribute(:features).of_type(Array)
        end

        it 'has :brand attribute' do
          expect(described_class).to have_attribute(:brand).of_type(Hash)
        end

        it 'has :photos attribute' do
          expect(described_class).to have_attribute(:photos).of_type(Array, member_type: Yoolk::Sandbox::Attachment)
        end
      end
    end
  end
end