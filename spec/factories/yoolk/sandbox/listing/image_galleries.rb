FactoryGirl.define do
  factory :image_galleries, class: Yoolk::Sandbox::Listing::ImageGallery do
    name     'Album 1'

    transient {
      gallery_images []
    }

    trait :gallery_images do
      transient do
        images_count 2
      end

      after(:build) do |galleries, evaluator|
        evaluator.images_count.times.each do
          galleries.images << build(:gallery_images)
        end
      end
    end

  end
end