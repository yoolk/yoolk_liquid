FactoryGirl.define do
  factory :product, class: Yoolk::Sandbox::ProductCatalog::Product do
    id        1
    name      'Rooftop'

    transient {
      url       '/samples/images/service/original/some-image.jpg'
      dimension ''
    }
    photos { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last, url: url) }
  end
end