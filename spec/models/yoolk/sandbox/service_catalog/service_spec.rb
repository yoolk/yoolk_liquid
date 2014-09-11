require 'rails_helper'

module Yoolk
  module Sandbox
    module ServiceCatalog
      describe Service do
        it 'has :id attribute' do
          expect(described_class).to have_attribute(:id).of_type(String)
        end

        it 'has :name attribute' do
          expect(described_class).to have_attribute(:name).of_type(String)
        end

        it 'has :description attribute' do
          expect(described_class).to have_attribute(:description).of_type(String)
        end

        it 'has :properties attribute' do
          expect(described_class).to have_attribute(:properties).of_type(Array)
        end

        it 'has :photos attribute' do
          expect(described_class).to have_attribute(:photos).of_type(Array, with_memeber: Yoolk::Sandbox::Attachment)
        end
      end
    end
  end
end