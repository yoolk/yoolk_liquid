module Yoolk
  module Sandbox
    module ServiceCatalog
      class Service < Yoolk::Sandbox::Base

        attribute :id,            String
        attribute :name,          String
        attribute :description,   String
        attribute :properties,    Array
        attribute :created_at,    DateTime
        attribute :updated_at,    DateTime

        attribute :photos,        Array[Yoolk::Sandbox::Attachment]
        attribute :category,      Yoolk::Sandbox::ServiceCatalog::Category

        def to_param
          "#{id}-#{name.parameterize}"
        end
      end
    end
  end
end