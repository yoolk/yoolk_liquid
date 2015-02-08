FactoryGirl.define do
  factory :instant_website_template, class: Yoolk::Sandbox::InstantWebsite::Template do
    transient {
      dimension ''
    }
    cover_photo { build(:instant_website_template_cover_photo, dimension: dimension) }
  end
end