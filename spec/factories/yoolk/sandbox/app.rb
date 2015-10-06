FactoryGirl.define do
  factory :apps, class: Yoolk::Sandbox::App do
    trait :service_catalog do
      id   1
      name 'Service Catalog'
    end

    trait :product_catalog do
      id   2
      name 'Product Catalog'
    end

    trait :menu do
      id   3
      name 'Menu'
    end
  end
end
