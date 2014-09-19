module Yoolk
  module Liquid
    class InstantWebsite::WebsiteCoverPhotoDrop < BaseDrop
      attributes  :id, :caption, :dimension, :display_order,
                  :created_at, :updated_at

      belongs_to  :image,       with: 'Yoolk::Liquid::AttachmentDrop'
    end
  end
end