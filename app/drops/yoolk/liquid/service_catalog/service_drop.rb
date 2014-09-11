module Yoolk
  module Liquid
    module ServiceCatalog
      class ServiceDrop < BaseDrop
        attributes :id, :name, :description, :properties

        has_many   :photos, with: 'Yoolk::Liquid::AttachmentDrop'
      end
    end
  end
end