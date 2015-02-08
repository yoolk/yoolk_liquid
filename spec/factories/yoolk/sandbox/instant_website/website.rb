FactoryGirl.define do
  factory :instant_website_website, class: Yoolk::Sandbox::InstantWebsite::Website do
    trait :cover_photos do
      transient do
        cover_photos_count 2
        dimensions         ''
      end

      after(:build) do |website, evaluator|
        evaluator.cover_photos_count.times.each do |i|
          website.cover_photos << build(:instant_website_website_cover_photo, dimension: evaluator.dimensions[i])
        end
      end
    end
  end
end