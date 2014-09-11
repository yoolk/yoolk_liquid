module Yoolk
  module Liquid
    module ProductCatalog
      class ProductDrop < BaseDrop
        attributes :id, :name, :description, :delivery, :created_at, :updated_at, :features, :brand

        has_many :photos, with: 'Yoolk::Liquid::AttachmentDrop'
      end
    end
  end
end