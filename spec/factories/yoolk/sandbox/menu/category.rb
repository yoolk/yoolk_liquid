FactoryGirl.define do
  factory :menu_category, class: Yoolk::Sandbox::Menu::Category do
    id        1
    name      'ice-cream'

    trait :foods do
      transient do
        foods_count 2
      end

      after(:build) do |category, evaluator|
        evaluator.foods_count.times.each do
          category.foods << build(:menu_food)
        end
      end
    end
  end
end