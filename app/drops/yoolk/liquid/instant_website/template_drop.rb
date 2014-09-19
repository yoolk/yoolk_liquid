module Yoolk
  module Liquid
    class InstantWebsite::TemplateDrop < BaseDrop
      attributes  :id, :name, :description, :is_responsive, :industries, :pages,
                  :created_at, :updated_at

      belongs_to  :thumbnail,     with: 'Yoolk::Liquid::AttachmentDrop'
      belongs_to  :cover_photo,   with: 'Yoolk::Liquid::InstantWebsite::TemplateCoverPhotoDrop'
    end
  end
end