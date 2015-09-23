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

      it '#home? return true when navigate to home page' do
        page = InstantWebsite::TemplatePage.new(name: 'Home')
        expect(page.home?).to eq(true)
      end

      it '#products? return true when navigate to products page' do
        page = InstantWebsite::TemplatePage.new(name: 'Products')
        expect(page.products?).to eq(true)
      end

      it '#services? return true when navigate to services page' do
        page = InstantWebsite::TemplatePage.new(name: 'Services')
        expect(page.services?).to eq(true)
      end

      it '#menu? return true when navigate to menu page' do
        page = InstantWebsite::TemplatePage.new(name: 'Menu')
        expect(page.menu?).to eq(true)
      end

      it '#photos? return true when navigate to photos page' do
        page = InstantWebsite::TemplatePage.new(name: 'Photos')
        expect(page.photos?).to eq(true)
      end

      it '#about_us? return true when navigate to about us page' do
        page = InstantWebsite::TemplatePage.new(name: 'About Us')
        expect(page.about_us?).to eq(true)
      end

      it '#contact_us? return true when navigate to contact_us page' do
        page = InstantWebsite::TemplatePage.new(name: 'Contact Us')
        expect(page.contact_us?).to eq(true)
      end

      it '#reservation? return true when navigate to reservation page' do
        page = InstantWebsite::TemplatePage.new(name: 'Reservation')
        expect(page.reservation?).to eq(true)
      end

      it '#feedback? return true when navigate to feedback page' do
        page = InstantWebsite::TemplatePage.new(name: 'Feedback')
        expect(page.feedback?).to eq(true)
      end

      it '#announcements? return true when navigate to announcements page' do
        page = InstantWebsite::TemplatePage.new(name: 'Announcements')
        expect(page.announcements?).to eq(true)
      end

      it '#videos? return true when navigate to videos page' do
        page = InstantWebsite::TemplatePage.new(name: 'Videos')
        expect(page.videos?).to eq(true)
      end

      it '#attachments? return true when navigate to attachments page' do
        page = InstantWebsite::TemplatePage.new(name: 'Attachments')
        expect(page.attachments?).to eq(true)
      end

      it '#links? return true when navigate to links page' do
        page = InstantWebsite::TemplatePage.new(name: 'Links')
        expect(page.links?).to eq(true)
      end

      it '#people? return true when navigate to people page' do
        page = InstantWebsite::TemplatePage.new(name: 'People')
        expect(page.people?).to eq(true)
      end

      it '#map? return true when navigate to map page' do
        page = InstantWebsite::TemplatePage.new(name: 'Map')
        expect(page.map?).to eq(true)
      end

      it '#Brochures? return true when navigate to brochures page' do
        page = InstantWebsite::TemplatePage.new(name: 'Brochures')
        expect(page.brochures?).to eq(true)
      end

    end
  end
end
