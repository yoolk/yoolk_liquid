require 'rails_helper'

module Yoolk
  module Sandbox
    module ServiceCatalog
      describe Service, 'model' do
        it 'has :id attribute' do
          expect(described_class).to have_attribute(:id).of_type(Integer)
        end

        it 'has :name attribute' do
          expect(described_class).to have_attribute(:name).of_type(String)
        end

        it 'has :price attribute' do
          expect(described_class).to have_attribute(:price).of_type(Float)
        end

        it 'has :description attribute' do
          expect(described_class).to have_attribute(:description).of_type(String)
        end

        it 'has :properties attribute' do
          expect(described_class).to have_attribute(:properties).of_type(Array)
        end

        it 'has :created_at attribute' do
          expect(described_class).to have_attribute(:created_at).of_type(DateTime)
        end

        it 'has :updated_at attribute' do
          expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
        end

        it 'has :category attribute' do
          expect(described_class).to have_attribute(:category).of_type(Yoolk::Sandbox::ServiceCatalog::Category)
        end

        it 'has :photos attribute' do
          expect(described_class).to have_attribute(:photos).of_type(Array, member_type: Yoolk::Sandbox::Attachment)
        end

        it { should respond_to(:to_param) }
      end
    end
  end
end