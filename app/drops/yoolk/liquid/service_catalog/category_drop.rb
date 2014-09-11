module Yoolk
  module Liquid
    module ServiceCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :alias_id, :short_name, :name, :description,
                    :to_param

        has_many    :services, with: 'Yoolk::Liquid::ServiceCatalog::ServiceDrop'

        def to_param
          object.to_param
        end
      end
    end
  end
end