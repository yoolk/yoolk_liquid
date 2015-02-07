module Yoolk
  module Liquid
    module InstantWebsite
      class WebsiteCoverPhotoDrop < BaseDrop
        attributes  :id, :caption, :dimension, :display_order,
                    :dimension_width, :dimension_height,
                    :created_at, :updated_at

        belongs_to  :image,       with: 'Yoolk::Liquid::AttachmentDrop'
      end
    end
  end
end