module Yoolk
  module Liquid
    module InstantWebsite
      class TemplateDrop < BaseDrop
        attributes  :id, :name, :theme_name, :description, :developed_by, :developer_url, :demo_website,
                    :is_responsive, :industries, :colors,
                    :created_at, :updated_at

        belongs_to  :thumbnail,     with: 'Yoolk::Liquid::AttachmentDrop'
        belongs_to  :pages,         with: 'Yoolk::Liquid::InstantWebsite::TemplatePageDrop'
        belongs_to  :cover_photo,   with: 'Yoolk::Liquid::InstantWebsite::TemplateCoverPhotoDrop'

        def name
          object.display_name
        end

        def theme_name
          object.name
        end
      end
    end
  end
end