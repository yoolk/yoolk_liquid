module Yoolk
  module Liquid
    class Listing::CatalogItemDrop < BaseDrop
      attributes  :id, :title, :html_text, :show_image, :published, :display_order,
                  :created_at, :updated_at

      belongs_to  :image, class_name: 'Yoolk::Liquid::AttachmentDrop'
    end
  end
end