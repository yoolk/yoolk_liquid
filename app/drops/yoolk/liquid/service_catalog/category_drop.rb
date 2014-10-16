module Yoolk
  module Liquid
    module ServiceCatalog
      class CategoryDrop < BaseDrop
        attributes  :id, :alias_id, :short_name, :name, :description,
                    :to_param

        has_many    :services, with: 'Yoolk::Liquid::ServiceCatalog::ServiceDrop'

        def url
          services_category_url(self)
        end

        def current?
          @context.registers[:controller].params[:category_id].to_s.start_with?(object.alias_id)
        end
      end
    end
  end
end