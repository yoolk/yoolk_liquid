module Yoolk
  module Liquid
    module InstantWebsite
      class PageDrop < BaseDrop
        include PageableDrop

        attributes  :id, :name, :created_at, :updated_at

        belongs_to  :template_page, with: 'Yoolk::Liquid::InstantWebsite::TemplatePageDrop'

        # Returns the localized/translated name of that page
        # @note If user customized the page's name, it will returns that name. Otherwise, it returns the localized version from its template page's name.
        # @return [String] the localized name of the page
        def name
          if object.name == object.template_page.name
            translate("#{theme_name}.links.#{locale_key}")
          else
            object.name
          end
        end

      end
    end
  end
end