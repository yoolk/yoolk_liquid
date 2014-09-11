module Yoolk
  module Sandbox
    module ServiceCatalog
      class Service < Yoolk::Sandbox::Base

        attribute :id,            String
        attribute :name,          String
        attribute :description,   String
        attribute :properties,    Array

        attribute :photos,        Array[Yoolk::Sandbox::Attachment]

      end
    end
  end
end