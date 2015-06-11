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
        subject { described_class.new(double(id: 12)) }

        it '#url' do
          expect(subject).to receive(:menu_category_url).with(subject)

          subject.url
        end

        it '#current? returns true' do
          @context.registers[:controller].params[:category_id] = '12-drink'

          expect(subject.current?).to eq(true)
        end

        it '#current? returns false' do
          @context.registers[:controller].params[:category_id] = '112-sea-food'

          expect(subject.current?).to eq(false)
        end

        describe 'uncategorized?' do
          it 'returns true' do
            category = build(:category, name: 'Uncategorized')
            expect(category.to_liquid.uncategorized?).to eq(true)
          end
          it 'returns false' do
            category = build(:category, name: 'Khmer foods')
            expect(category.to_liquid.uncategorized?).to eq(false)
          end
        end
      end
    end
  end
end