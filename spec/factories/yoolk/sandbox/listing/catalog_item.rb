FactoryGirl.define do
  factory :catalog_item, class: Yoolk::Sandbox::Listing::CatalogItem do
    transient {
      dimension ''
      url       '/samples/images/catalog_items/original/some-image.jpg'
    }
    image { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last, url: url) }
  end
end