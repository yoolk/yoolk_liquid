require 'rails_helper'

module Yoolk
  module Liquid
    describe UrlFilter do
      it 'renders product url' do
        product = build(:product)
        product_drop = product.to_liquid

        expected = "/products/1-rooftop"
        expect_template_result("{{ product.url }}", expected, {'product' => product_drop})
      end

      it 'renders food url' do
        food = build(:menu_food, :category)
        food_drop = food.to_liquid

        expected = "/menu-categories/1-ice-cream/menu/1-chocolate-cream"
        expect_template_result("{{ food.url }}", expected, {'food' => food_drop})
      end

      context '#within' do
        let(:food)          { build(:menu_food, :category) }
        let(:food_drop)     { food.to_liquid }
        let(:category_drop) { food.category.to_liquid }

        it 'returns url within :category handle' do
          expected = '/menu-categories/1-ice-cream/menu/1-chocolate-cream'

          expect_template_result("{{ food.url | within: category }}", expected, { 'food' => food_drop, 'category' => category_drop })
        end
      end

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
