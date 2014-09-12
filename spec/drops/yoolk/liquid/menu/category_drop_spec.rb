require 'rails_helper'

module Yoolk
  module Liquid
    module Menu
      describe CategoryDrop, 'model' do
        it { should have_attribute(:id) }
        it { should have_attribute(:name) }
        it { should have_attribute(:created_at) }
        it { should have_attribute(:updated_at) }
        it { should have_attribute(:to_param) }

        it { should have_many(:foods).with('Yoolk::Liquid::Menu::FoodDrop') }
      end

      describe CategoryDrop, 'methods' do
        let(:category)  { Yoolk::Sandbox::Menu::Category.new(id: 1, name: 'Soft Drink') }
        let(:drop)      { category.to_liquid }

        it '#url' do
          expect(drop).to receive(:menu_category_url).with(drop)

          drop.url
        end
      end
    end
  end
end