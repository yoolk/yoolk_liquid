FactoryGirl.define do
  factory :gallery_images, class: Yoolk::Sandbox::Listing::GalleryImage do
    caption     'Some Caption'

    transient {
      dimension ''
      url       '/samples/images/catalog_items/original/some-image.jpg'
    }

    image { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last, url: url) }
  end
end