FactoryGirl.define do
  factory :listing, class: Yoolk::Sandbox::Listing do
    name              'Yellow Tower inc.'
    alias_id          'kh34363'
    installed_apps    { [ build(:apps) ] }

    trait :services do
      transient do
        service_count 2
      end

      after(:build) do |listing, evaluator|
        evaluator.service_count.times.each do
          listing.service_categories << Yoolk::Sandbox::ServiceCatalog::Category.new(name: "category1", services: [ build(:service) ])
        end
      end
    end

    trait :image_galleries do
      transient do
        galleries_count 2
        galleries_name  'Album'
      end

      ignore do
        comments_count 0
      end

      after(:build) do |listing, evaluator|
        evaluator.galleries_count.times.each do
          listing.image_galleries << build(:image_galleries, evaluator.galleries_name)
        end
      end
    end

  end
end