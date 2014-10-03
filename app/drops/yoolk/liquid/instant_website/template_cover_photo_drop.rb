module Yoolk
  module Liquid
    module InstantWebsite
      class TemplateCoverPhotoDrop < BaseDrop
        attributes  :id, :dimension, :created_at, :updated_at

        belongs_to  :image,       with: 'Yoolk::Liquid::AttachmentDrop'
      end
    end
  end
end