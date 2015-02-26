module Yoolk
  module Liquid
    module InstantWebsite
      class CustomPageDrop < BaseDrop
        attributes  :id, :name, :created_at, :updated_at

        belongs_to  :template_page,      with: 'Yoolk::Liquid::InstantWebsite::TemplatePage'
      end
    end
  end
end