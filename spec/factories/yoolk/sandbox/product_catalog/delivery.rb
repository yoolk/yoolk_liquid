FactoryGirl.define do
  factory :product_catalog_delivery, class: Yoolk::Sandbox::ProductCatalog::Delivery do
    id          1
    fee         12.3
    name        'Rooftop'

    trait :pickup do
      type        'pickup'
      description { 'some description.' }
    end

    trait :local_delivery do
      type        'local_delivery'
    end
  end
end
