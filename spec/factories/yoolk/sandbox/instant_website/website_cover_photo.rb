FactoryGirl.define do
  factory :instant_website_website_cover_photo, class: Yoolk::Sandbox::InstantWebsite::WebsiteCoverPhoto do
    image     { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last) }
  end
end