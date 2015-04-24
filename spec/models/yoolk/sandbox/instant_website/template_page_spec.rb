require 'rails_helper'

module Yoolk
  module Sandbox

    describe InstantWebsite::TemplatePage do
      it 'has :id attribute' do
        expect(described_class).to have_attribute(:id).of_type(String)
      end

      it 'has :name attribute' do
        expect(described_class).to have_attribute(:name).of_type(String)
      end

      it 'has :display_order attribute' do
        expect(described_class).to have_attribute(:display_order).of_type(Integer)
      end

      it 'has :updated_at attribute' do
        expect(described_class).to have_attribute(:updated_at).of_type(DateTime)
      end
    end

    describe InstantWebsite::TemplatePage, 'methods' do
      it { should respond_to(:menu?) }
      it { should respond_to(:products?) }
      it { should respond_to(:services?) }
      it { should respond_to(:about_us?) }
      it { should respond_to(:map?) }

      it '#menu? return true when navigate to menu page' do
        page = InstantWebsite::TemplatePage.new(name: 'Menu')
        expect(page.menu?).to eq(true)
      end

      it '#products? return true when navigate to products page' do
        page = InstantWebsite::TemplatePage.new(name: 'Products')
        expect(page.products?).to eq(true)
      end

      it '#services? return true when navigate to services page' do
        page = InstantWebsite::TemplatePage.new(name: 'Services')
        expect(page.services?).to eq(true)
      end

      it '#about_us? return true when navigate to about us page' do
        page = InstantWebsite::TemplatePage.new(name: 'About Us')
        expect(page.about_us?).to eq(true)
      end

      it '#map? return true when navigate to map page' do
        page = InstantWebsite::TemplatePage.new(name: 'Map')
        expect(page.map?).to eq(true)
      end
    end
  end
end