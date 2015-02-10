module Yoolk
  module Liquid
    module InstantWebsite
      class TemplateDrop < BaseDrop
        attributes  :id, :name, :display_name, :description, :developed_by, :developer_url, :demo_website,
                    :is_responsive, :industries, :pages, :colors,
                    :created_at, :updated_at

        belongs_to  :thumbnail,     with: 'Yoolk::Liquid::AttachmentDrop'
        belongs_to  :cover_photo,   with: 'Yoolk::Liquid::InstantWebsite::TemplateCoverPhotoDrop'
      end
    end
  end
end