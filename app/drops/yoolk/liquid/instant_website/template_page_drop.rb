module Yoolk
  module Liquid
    module InstantWebsite
      class TemplatePageDrop < BaseDrop
        include PageableDrop

        attributes  :id, :name, :display_order, :created_at, :updated_at

        def name
          translate("#{theme_name}.links.#{locale_key}")
        end

      end
    end
  end
end