module Yoolk
  module Liquid
    module InstantWebsite
      class WebsiteCoverPhotoDrop < BaseDrop
        attributes  :id, :caption, :dimension, :display_order,
                    :created_at, :updated_at

        belongs_to  :image,       with: 'Yoolk::Liquid::AttachmentDrop'

        def dimension_width
          dimension.split("x")[0].to_i
        end

        def dimension_height
          dimension.split("x")[1].to_i
        end
      end
    end
  end
end