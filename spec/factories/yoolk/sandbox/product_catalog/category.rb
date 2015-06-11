FactoryGirl.define do
  factory :product_category, class: Yoolk::Sandbox::ProductCatalog::Category do
    id          1
    name        'Rooftop'
    name_path   'Rental Service > Building site'
    product_ids []

  end
end