module Yoolk
  module Liquid
    class AttachmentDrop < BaseDrop
      attributes  :id, :content_type

      delegate    :styles, :width, :height, :size, :url,
                  to: :object
    end
  end
end