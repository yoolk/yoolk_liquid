require 'rails_helper'

module Yoolk
  module Liquid
    describe UrlFilter do
      context '#attachment_url' do
        let(:catalog_item)  { build(:catalog_item, dimension: '200x400') }
        let(:drop)          { catalog_item.to_liquid }

        it 'render url by only pass main object' do
          expected = "/samples/images/catalog_items/original/some-image.jpg"
          expect_template_result("{{ catalog_item | attachment_url: 'original' }}", expected, {'catalog_item' => drop})
        end

        it "render url of object's image" do
          expected = "/samples/images/catalog_items/original/some-image.jpg"
          expect_template_result("{{ catalog_item.image | attachment_url: 'original' }}", expected, {'catalog_item' => drop})
        end

        it "render nil of object is nil" do
          expect_template_result("{{ catalog_item | attachment_url: 'original' }}", nil, {'catalog_item' => nil})
        end
      end
    end
  end
end
