require 'rails_helper'

module Yoolk
  module Liquid
    describe InstantWebsite::PageDrop do
      it { should include_module(Yoolk::Liquid::InstantWebsite::PageableDrop) }

      it { should have_attribute(:id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:created_at) }
      it { should have_attribute(:updated_at) }
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

        it 'return true if it is one of a primary page' do
          expect(drop.show?).to eq(true)
        end

        it 'return false if not in preview mode or collection empty' do
          # page.template_page = build(:instant_website_template_page, name: 'About Us')
          # drop = page.to_liquid

          # request_drop  = ::Yoolk::Liquid::RequestDrop.new
          # allow(request_drop).to receive(:preview_mode?).and_return(true)

          # @context['request'] = request_drop
          # @context['listing'] = { "products" => [{ "name" => "cola" }]}
          # drop.context = @context

          # binding.pry
        end
        it 'return true if preview mode but collection is not empty' do
        end
        it 'return true if not preview mode but collection is not empty' do
        end
      end
      context '#active?' do
        it 'return true if request to current template page' do
        end
        it 'return false if request to another template page' do
        end
      end
    end
  end
end