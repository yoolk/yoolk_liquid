module Yoolk
  module Liquid
    class Listing::LogoDrop < BaseDrop
      attributes  :id, :created_at, :updated_at

      delegate    :styles, :width, :height, :size, :url,
                  to: :object
    end
  end
end