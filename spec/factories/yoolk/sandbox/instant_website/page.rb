FactoryGirl.define do
  factory :instant_website_page, class: Yoolk::Sandbox::InstantWebsite::Page do
    name          'My Products'
    template_page { build(:instant_website_template_page, name: 'Products') }
  end
end