module Yoolk
  module Liquid
    class InstantWebsite::TemplateCoverPhotoDrop < BaseDrop
      attributes  :id, :dimension, :created_at, :updated_at

      belongs_to  :image,       with: 'Yoolk::Liquid::AttachmentDrop'
    end
  end
end