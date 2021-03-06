require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::WebsiteDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:template_name) }
      it { should have_attribute(:color) }
      it { should have_attribute(:google_analytics_key) }
      it { should have_attribute(:owner_google_analytics_key) }
      it { should have_attribute(:google_webmaster_tag) }
      it { should have_attribute(:is_live) }
      it { should have_attribute(:is_active) }
      it { should have_attribute(:free_plan) }
      it { should have_attribute(:primary_domain) }
      it { should have_attribute(:has_store) }
      it { should have_attribute(:return_policy) }
      it { should have_attribute(:terms_and_conditions) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }

      it { should belongs_to(:favicon).with('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:webclip).with('Yoolk::Liquid::AttachmentDrop') }
      it { should belongs_to(:template).with('Yoolk::Liquid::InstantWebsite::TemplateDrop') }
      it { should have_many(:domains).with('Yoolk::Liquid::InstantWebsite::DomainDrop') }
      it { should have_many(:tracking_services).class_name('Yoolk::Liquid::InstantWebsite::TrackingServicesDrop').with('Yoolk::Liquid::InstantWebsite::TrackingServiceDrop')}
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

      it { should respond_to(:color) }
      it { should respond_to(:office_url) }

      context '#color' do
        it 'returns color_name' do
          website = build(:instant_website_website, color_name: 'blue')
          drop    = website.to_liquid

          expect(drop.color).to eq('blue')
        end
      end

      context '#office_url' do
        it 'returns office_path' do
          allow(subject).to receive(:office_path).and_return('/office')

          expect(subject.office_url).to eq('/office')
        end
      end

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

      it '#current_page' do
        allow(subject.send(:controller)).to receive(:controller_path).and_return('products')

        expect(drop.current_page).to be_instance_of(Yoolk::Liquid::InstantWebsite::PageDrop)
        expect(drop.current_page.send(:object).name).to eq('Products')
      end

    end

    describe InstantWebsite::WebsiteDrop, 'all pages' do
      let(:page_names) { [  'Home', 'Products', 'Services', 'Menu', 'Photos', 'Galleries',
                            'About Us', 'Contact Us', 'Reservation', 'Feedback',
                            'Announcements', 'Videos', 'Attachments', 'Links',
                            'People', 'Map', 'Brochures' ] }
      let(:template) { build(:instant_website_template, page_names: page_names) }
      let(:website)  { build(:instant_website_website, template: template, pages: []) }
      let(:drop)     { website.to_liquid }

      before  {
        drop.context  = @context
      }

      it '#home_page' do
        expect(drop.home_page.send(:object).name).to eq('Home')
      end

      it '#products_page' do
        expect(drop.products_page.send(:object).name).to eq('Products')
      end

      it '#services_page' do
        expect(drop.services_page.send(:object).name).to eq('Services')
      end

      it '#menu_page' do
        expect(drop.menu_page.send(:object).name).to eq('Menu')
      end

      it '#photos_page' do
        expect(drop.photos_page.send(:object).name).to eq('Photos')
      end

      it '#about_us_page' do
        expect(drop.about_us_page.send(:object).name).to eq('About Us')
      end

      it '#contact_us_page' do
        expect(drop.contact_us_page.send(:object).name).to eq('Contact Us')
      end

      it '#reservation_page' do
        expect(drop.reservation_page.send(:object).name).to eq('Reservation')
      end

      it '#feedback_page' do
        expect(drop.feedback_page.send(:object).name).to eq('Feedback')
      end

      it '#announcements_page' do
        expect(drop.announcements_page.send(:object).name).to eq('Announcements')
      end

      it '#videos_page' do
        expect(drop.videos_page.send(:object).name).to eq('Videos')
      end

      it '#attachments_page' do
        expect(drop.attachments_page.send(:object).name).to eq('Attachments')
      end

      it '#links_page' do
        expect(drop.links_page.send(:object).name).to eq('Links')
      end

      it '#people_page' do
        expect(drop.people_page.send(:object).name).to eq('People')
      end

      it '#map_page' do
        expect(drop.map_page.send(:object).name).to eq('Map')
      end

      it '#brochures_page' do
        expect(drop.brochures_page.send(:object).name).to eq('Brochures')
      end

      it '#galleries_page' do
        expect(drop.galleries_page.send(:object).name).to eq('Photos')
      end
    end
  end
end
