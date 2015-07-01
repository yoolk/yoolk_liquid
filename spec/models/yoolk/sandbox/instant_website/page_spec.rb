require 'rails_helper'

module Yoolk
  module Sandbox
    describe InstantWebsite::Page do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :display_order attribute' do
        expect(described_class).to have_attribute(:display_order).of_type(Integer)
      end

      it 'has :meta_title attribute' do
        expect(described_class).to have_attribute(:meta_title).of_type(String)
      end

      it 'has :meta_description attribute' do
        expect(described_class).to have_attribute(:meta_description).of_type(String)
      end

      it 'has :meta_keyword attribute' do
        expect(described_class).to have_attribute(:meta_keyword).of_type(String)
      end

      it 'has :template_page attribute' do
        expect(described_class).to have_attribute(:template_page).of_type(Yoolk::Sandbox::InstantWebsite::TemplatePage)
      end

      it 'has :created_at attribute' do
        expect(described_class).to have_attribute(:created_at).of_type(DateTime)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end

    end
  end
end