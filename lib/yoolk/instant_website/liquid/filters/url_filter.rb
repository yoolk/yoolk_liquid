module Yoolk
  module InstantWebsite
    module Liquid
      module UrlFilter
        def theme_asset_path(input)
          @context.registers['helper'].asset_path("#{@context['current_theme']}/#{input}")
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

        # If condition is true, the class_name is returned. Otherwise, it returns nil.
        # class_name: css class name
        # condition: boolean
        def toggle_class_name(class_name, condition)
          condition ? class_name : nil
        end

        def link_to_home(value)
          link_to value, root_path, value, toggle_class_name('active', current_page?(:root))
        end

        def root_path
          '/'
        end

        # Return true if the input is the current page
        # value: could be 'root', 'foods', 'products', 'services', 'contact_us', 'about_us'
        def current_page?(value)
          value = value.to_sym
          if value == :root
            @context.registers['controller'].request.fullpath == root_path
          end
        end
      end
    end
  end
end