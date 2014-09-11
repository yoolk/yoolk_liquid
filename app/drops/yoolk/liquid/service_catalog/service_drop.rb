module Yoolk
  module Liquid
    module ServiceCatalog
      class ServiceDrop < BaseDrop
        attributes  :id, :name, :description, :properties,
                    :created_at, :updated_at, :to_param

        belongs_to  :category, class_name: 'Yoolk::Liquid::ServiceCatalog::CategoryDrop'
        has_many    :photos, with: 'Yoolk::Liquid::AttachmentDrop'

        def url
          service_path(self)
        end

        def to_param
          object.to_param
        end
      end
    end
  end
end