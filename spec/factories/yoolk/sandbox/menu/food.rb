FactoryGirl.define do
  factory :menu_food, class: Yoolk::Sandbox::Menu::Food do
    id        1
    name      'chocolate-cream'

    transient {
      url       '/samples/images/food/original/some-image.jpg'
      dimension ''
    }

    photos { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last, url: url) }

    trait :category do
      after(:build) do |food, evaluator|
        food.category = build(:menu_category)
      end
    end
  end
end