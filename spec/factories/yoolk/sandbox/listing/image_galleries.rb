FactoryGirl.define do
  factory :image_galleries, class: Yoolk::Sandbox::Listing::ImageGallery do
    name     'Album 1'

    transient {
      gallery_images []
    }
  end
end