module Yoolk
  module Liquid
    module ServiceCatalog
      class ServiceDrop < BaseDrop
        attributes  :id, :name, :description, :properties,
                    :created_at, :updated_at, :to_param

        belongs_to  :category, class_name: 'Yoolk::Liquid::ServiceCatalog::CategoryDrop'
        has_many    :photos, with: 'Yoolk::Liquid::AttachmentDrop'

        def url
          service_url(self)
        end

        def read_properties
          keys, result = ["name", "value"], []
          properties.each do |property|
            result.push Hash[keys.zip(property.to_a.flatten)]
          end
          result
        end

      end
    end
  end
end