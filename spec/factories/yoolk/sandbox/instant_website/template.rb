FactoryGirl.define do
  factory :instant_website_template, class: Yoolk::Sandbox::InstantWebsite::Template do
    transient {
      dimension   ''
      page_names  []
    }
    cover_photo { build(:instant_website_template_cover_photo, dimension: dimension) }

    after(:build) do |template, elevator|
      elevator.page_names.each_with_index do |page_name, index|
        template.pages << build(:instant_website_template_page, name: page_name, display_order: index+1)
      end
    end
  end
end