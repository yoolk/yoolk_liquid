module Yoolk
  module Liquid
    class Listing::CatalogItemDrop < BaseDrop
      attributes  :id, :title, :html_text, :show_image, :published, :display_order,
                  :image, :created_at, :updated_at

      delegate    :styles, :width, :height, :size, :url,
                  to: :object
    end
  end
end