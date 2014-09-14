module Yoolk
  module Liquid
    class Listing::ArtworkDrop < BaseDrop
      attributes  :id, :name, :text, :description, :is_active,
                  :created_at, :updated_at

      belongs_to  :image, class_name: 'Yoolk::Liquid::AttachmentDrop'
    end
  end
end