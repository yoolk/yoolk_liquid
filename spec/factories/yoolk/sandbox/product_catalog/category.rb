FactoryGirl.define do
  factory :product_category, class: Yoolk::Sandbox::ProductCatalog::Category do
    id          1
    name        'Rooftop'
    product_ids []

    trait :products do
      transient do
        products_count 2
      end

      after(:build) do |category, evaluator|
        evaluator.products_count.times.each do
          category.products << build(:product)
        end
      end
    end
  end
end