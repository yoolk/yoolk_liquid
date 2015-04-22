require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageDrop do
      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
      it { should belongs_to(:website).with('Yoolk::Liquid::InstantWebsite::WebsiteDrop') }
      it { should belongs_to(:template_page).with('Yoolk::Liquid::InstantWebsite::TemplatePageDrop') }

      it { should respond_to(:name) }
      it { should respond_to(:url) }
      it { should respond_to(:show?) }
      it { should respond_to(:active?) }
    end

    describe InstantWebsite::PageDrop, "@methods" do
      let(:template_page) { build(:instant_website_template_page, name: 'Products') }
      let(:page)          { build(:instant_website_page, name: 'My Products', template_page: template_page) }
      let(:drop)          { page.to_liquid }

      before              {
        @context['request'] = { 'theme_name' => 'theme_a' }
        drop.context = @context
      }

      context '#name' do
        it "returns its page's name" do
          expect(drop.name).to eq('My Products')
        end

        it "returns template_page's name in localized" do
          page.name = 'Products'

          expect(drop.name).to eq(I18n.t(:'links.products'))
        end
      end

      context '#url' do
        it "return path of the page" do
          expect(drop.url).to eq("/products")
        end
      end

      context '#show?' do
        it 'return true if important page' do
          expect(drop.show?).to be(true)
        end

        it 'return true if in preview mode' do
          allow(page).to receive(:important?).and_return(false)
          @context['request'] = @context['request'].merge( 'preview_mode?' => true )
          drop.context = @context

          expect(drop.show?).to be(true)
        end

        it 'return true if collection exist and has app installed' do
          allow(page).to receive(:important?).and_return(false)
          @context['request'] = @context['request'].merge( 'preview_mode?' => false )

          page.name = "Our Services"
          page.template_page.name = "Services"
          drop = page.to_liquid

          @context['listing'] = build(:listing, :services)
          drop.context = @context

          expect(drop.show?).to eq(true)
        end

        it 'return true if collection exist' do
          allow(page).to receive(:important?).and_return(false)
          @context['request'] = @context['request'].merge( 'preview_mode?' => false )

          page.name = "Photos"
          page.template_page.name = "Galleries"
          drop = page.to_liquid

          @context['listing'] = build(:listing, image_galleries: [build(:image_galleries)])
          drop.context = @context

          expect(drop.show?).to eq(true)
        end
      end
    end
  end
end