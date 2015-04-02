module Yoolk
  module Liquid
    module ServiceCatalog
      class ServiceDrop < BaseDrop
        attributes  :id, :name, :price, :description, :properties,
                    :created_at, :updated_at, :to_param

        belongs_to  :category, class_name: 'Yoolk::Liquid::ServiceCatalog::CategoryDrop'
        has_many    :photos, with: 'Yoolk::Liquid::AttachmentDrop'

        def url
          service_url(self)
        end

        def cover_photo
          photos[0]
        end
      end
    end
  end
end