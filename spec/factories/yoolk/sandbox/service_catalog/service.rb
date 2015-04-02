FactoryGirl.define do
  factory :service, class: Yoolk::Sandbox::ServiceCatalog::Service do
    name      'Rooftop'

    transient {
      url       '/samples/images/service/original/some-image.jpg'
      dimension ''
    }

    photos { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last, url: url) }
  end
end