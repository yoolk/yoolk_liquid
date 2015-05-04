require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::WebsiteDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:template_name) }
      it { should have_attribute(:color) }
      it { should have_attribute(:google_analytics_key) }
      it { should have_attribute(:owner_google_analytics_key) }
      it { should have_attribute(:is_live) }
      it { should have_attribute(:is_active) }
      it { should have_attribute(:free_plan) }
      it { should have_attribute(:primary_domain) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:favicon).with('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:template).with('Yoolk::Liquid::InstantWebsite::TemplateDrop') }
      it { should have_many(:domains).with('Yoolk::Liquid::InstantWebsite::DomainDrop') }
    end

    describe InstantWebsite::WebsiteDrop, '#cover_photos' do
      let(:template)  { build(:instant_website_template, dimension: '200x400') }
      let(:website1)  { build(:instant_website_website, :cover_photos, template: template, dimensions: ['200x400', '400x200']) }
      let(:website2)  { build(:instant_website_website, :cover_photos, template: template, dimensions: ['200x400', '400x200']) }
      let(:drop1)     { website1.to_liquid }
      let(:drop2)     { website2.to_liquid }

      before          {
        drop1.context = context
        drop2.context = context
      }

      it { should respond_to(:office_url) }

      context '#cover_photos' do
        it 'returns an instance of Liquid::Rails::CollectionDrop' do
          expect(drop1.cover_photos).to be_instance_of(::Liquid::Rails::CollectionDrop)
        end

        it 'returns the cover_photos that matches its template' do
          expect(drop1.cover_photos.length).to eq(1)
          expect(drop1.cover_photos[0].dimension).to eq(template.cover_photo.dimension)
        end

        it 'returns empty array when template doesn\'t have cover_photo' do
          template.cover_photo = nil

          expect(drop1.cover_photos.length).to eq(0)
        end
      end
    end

    describe InstantWebsite::WebsiteDrop, '#pages' do
      let(:template) { build(:instant_website_template, page_names: ['Products', 'Services', 'About Us']) }
      let(:website)  { build(:instant_website_website, template: template, pages: []) }
      let(:drop)     { website.to_liquid }

      context 'website without pages when previewed_template' do
        before       {
          @context['request'] = { 'previewed_template' => template }
          drop.context        = @context
        }

        it 'returns an instance of PagesDrop' do
          expect(drop.pages).to be_instance_of(Yoolk::Liquid::InstantWebsite::PagesDrop)
        end

        it 'returns pages of template when its pages is blank' do
          expect(drop.pages.count).to   eq(template.pages.count)
        end
      end

      context 'website without pages with its template' do
        before       {
          @context['request'] = { 'previewed_template' => nil }
          drop.context        = @context
        }

        it 'returns an instance of PagesDrop' do
          expect(drop.pages).to be_instance_of(Yoolk::Liquid::InstantWebsite::PagesDrop)
        end

        it 'returns pages of template when its pages is blank' do
          expect(drop.pages.count).to   eq(template.pages.count)
        end
      end

      context 'website with pages' do
        before  {
          website.pages << build(:instant_website_page, name: 'Products', display_order: 1)
          @context['request'] = { 'previewed_template' => nil }
          drop.context        = @context
        }

        it 'returns an instance of PagesDrop' do
          expect(drop.pages).to be_instance_of(Yoolk::Liquid::InstantWebsite::PagesDrop)
        end

        it 'returns the number of pages the same as its template\'s pages' do
          expect(drop.pages.count).to   eq(template.pages.count)
        end
      end
    end
    describe InstantWebsite::WebsiteDrop, '#current_page' do
      let(:template) { build(:instant_website_template, page_names: ['Products', 'Services', 'About Us']) }
      let(:website)  { build(:instant_website_website, template: template, pages: []) }
      let(:drop)     { website.to_liquid }

      before  {
        website.pages << build(:instant_website_page, name: 'Products', display_order: 1)
        drop.context        = @context
      }

      it 'return page object' do
        allow(subject.send(:controller)).to receive(:controller_path).and_return('products')

        expect(drop.current_page).to be_instance_of(Yoolk::Liquid::InstantWebsite::PageDrop)
        expect(drop.current_page.send(:object).name).to eq('Products')
      end
    end
  end
end