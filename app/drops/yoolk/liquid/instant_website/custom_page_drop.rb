module Yoolk
  module Liquid
    module InstantWebsite
      class CustomPageDrop < BaseDrop
        attributes  :id, :name, :created_at, :updated_at

        belongs_to  :template_page,      with: 'Yoolk::Liquid::InstantWebsite::TemplatePage'

        def url
          page_name = template_page.name.parameterize.underscore
          page = case page_name
                 when "menu", "reservation", "feedback" then "#{page_name}_index"
                 else page_name end

          eval "view.#{page}_path"
        end

        def show?
          page_name = template_page.name.parameterize.underscore
          collection = case page_name
                 when "brochures" then "artworks"
                 when "about_us"  then "catalog_items"
                 when "videos"    then "medias"
                 else page_name   end

          unless page_name.in? ["products", "menu", "services", "reservation", "feedback", "contact_us"]
            @context["request"].preview_mode? or \
            eval %{@context['listing'].#{collection}.present?}
          else
            true
          end
        end

        def view
          @context.registers[:view]
        end
      end
    end
  end
end