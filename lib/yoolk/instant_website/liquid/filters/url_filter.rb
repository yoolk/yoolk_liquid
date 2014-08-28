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

        def link_to(link, url, title='')
          %|<a href="#{url}" title="#{title}">#{link}</a>|
        end

        def img_tag(url, alt='')
          %|<img src="#{url}" alt="#{alt}" />|
        end

        def link_to_home
          link_to t(:'links.home'), root_path, toggle_class_name('active', home_controller?)
        end

        def root_path
          '/'
        end

        def current_page?(value)
          value = value.to_sym
          if value == :root
            request.fullpath == root_url
          end
        end

        private

          def t(name)
            @context.registers['helper'].t(name)
          end
      end
    end
  end
end