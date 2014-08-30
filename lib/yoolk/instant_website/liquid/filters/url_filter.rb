module Yoolk
  module InstantWebsite
    module Liquid
      module UrlFilter
        def asset_path(input)
          theme = "#{@context['current_theme']}"
          input = "#{theme}/#{input}" unless input.to_s.start_with?("#{theme}/")

          @context.registers[:helper].asset_path(input)
        end

        def script_tag(url)
          %(<script src="#{url}" type="text/javascript"></script>)
        end

        def stylesheet_tag(url, media='all')
          %(<link href="#{url}" rel="stylesheet" type="text/css" media="#{media}" />)
        end

        def link_to(link, url, title='', class_name='')
          %|<a href="#{url}" title="#{title}" class="#{class_name}">#{link}</a>|
        end

        def image_tag(url, alt='')
          %|<img src="#{url}" alt="#{alt}" />|
        end

        # Navigation links
        def office_path
          '/office'
        end

        def link_to_office(value)
          link_to value, office_path, value
        end

        def home_path
          '/'
        end

        def link_to_home(value)
          link_to value, home_path, value, toggle_class_name('active', current_page?(home_path))
        end

        def galleries_path
          '/galleries'
        end

        def link_to_galleries(value)
          link_to value, galleries_path, value, toggle_class_name('active', current_page?(galleries_path))
        end

        def people_path
          '/people'
        end

        def link_to_people(value)
          link_to value, people_path, value, toggle_class_name('active', current_page?(people_path))
        end

        def products_path
          '/products'
        end

        def link_to_products(value)
          link_to value, products_path, value, toggle_class_name('active', current_page?(products_path))
        end

        def services_path
          '/services'
        end

        def link_to_services(value)
          link_to value, services_path, value, toggle_class_name('active', current_page?(services_path))
        end

        def foods_path
          '/foods'
        end

        def link_to_foods(value)
          link_to value, foods_path, value, toggle_class_name('active', current_page?(foods_path))
        end

        def announcements_path
          '/announcements'
        end

        def link_to_announcements(value)
          link_to value, announcements_path, value, toggle_class_name('active', current_page?(announcements_path))
        end

        def map_path
          '/map'
        end

        def link_to_map(value)
          link_to value, map_path, value, toggle_class_name('active', current_page?(map_path))
        end

        # Return true if the input is the current page
        # path: could be 'home_path', 'foods_path', 'products_path', 'services_path', 'contact_us_path', 'about_us_path'
        def current_page?(path)
          @context.registers['controller'].request.fullpath == path
        end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::InstantWebsite::Liquid::UrlFilter