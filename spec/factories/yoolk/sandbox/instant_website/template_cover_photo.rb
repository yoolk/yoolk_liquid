FactoryGirl.define do
  factory :instant_website_template_cover_photo, class: Yoolk::Sandbox::InstantWebsite::TemplateCoverPhoto do
    image     { build(:attachment, width: dimension.to_s.split('x').first, height: dimension.to_s.split('x').last) }
  end
end