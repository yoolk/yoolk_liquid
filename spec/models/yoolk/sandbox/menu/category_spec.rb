require 'rails_helper'

module Yoolk
  module Sandbox
    module Menu
      describe Category do
        it 'has :id attribute' do
          expect(described_class).to have_attribute(:id).of_type(Integer)
        end

        it 'has :name attribute' do
          expect(described_class).to have_attribute(:name).of_type(String)
        end

        it 'has :foods_count attribute' do
          expect(described_class).to have_attribute(:foods_count).of_type(Integer)
        end

        it 'has :display_order attribute' do
          expect(described_class).to have_attribute(:display_order).of_type(Integer)
        end

        it 'has :created_at attribute' do
          expect(described_class).to have_attribute(:created_at).of_type(DateTime)
        end

        it 'has :updated_at attribute' do
          expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
        end

        it 'has :food_ids attribute' do
          expect(described_class).to have_attribute(:food_ids).of_type(Array)
        end

        it 'has :listing attribute' do
          expect(described_class).to have_attribute(:listing).of_type(Yoolk::Sandbox::Listing)
        end

        it { should respond_to(:uncategorized?) }
        it { should respond_to(:foods) }
        it { should respond_to(:to_param) }
      end
    end
  end
end