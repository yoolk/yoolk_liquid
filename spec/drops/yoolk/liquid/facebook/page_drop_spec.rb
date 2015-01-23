require 'rails_helper'

module Yoolk
  module Liquid
    describe Facebook::PageDrop, 'attributes' do
      it { should have_attribute(:id) }
      it { should have_attribute(:facebook_id) }
      it { should have_attribute(:name) }
      it { should have_attribute(:url) }
      it { should have_attribute(:cover_photo_url) }
    end

    describe Facebook::PageDrop, '#username' do
      let(:url1) { 'https://www.facebook.com/pages/Page-example/596388333755671' }
      let(:url2) { 'https://www.facebook.com/yoolkin' }
      let(:url3) { 'https://www.facebook.com/yoolkin?ref=internal' }

      it 'returns without /pages/' do
        page = Yoolk::Sandbox::Facebook::Page.new(page_url: url1)

        expect(page.to_liquid.username).to eq('Page-example/596388333755671')
      end

      it 'returns path' do
        page = Yoolk::Sandbox::Facebook::Page.new(page_url: url2)

        expect(page.to_liquid.username).to eq('yoolkin')
      end

      it 'returns path without querystring' do
        page = Yoolk::Sandbox::Facebook::Page.new(page_url: url3)

        expect(page.to_liquid.username).to eq('yoolkin')
      end
    end
  end
end