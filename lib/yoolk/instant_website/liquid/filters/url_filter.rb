module Yoolk
  module InstantWebsite
    module Liquid
      module UrlFilter

        delegate \
                  :root_path,

                  :galleries_path,
                  :gallery_path,

                  :people_path,
                  :person_path,

                  :brochures_path,

                  :map_path,
                  :about_us_path,
                  :contact_us_path,

                  :products_path,
                  :products_category_path,

                  :services_path,
                  :services_category_path,

                  :menu_path,
                  :menu_category_path,

                  :announcements_path,
                  :announcement_path,

                  to: :controller

        def office_path
          '/office'
        end

        def home_path
          root_path
        end

        def product_path(product)
          controller.product_path(product.category, product)
        end

        def service_path(service)
          controller.service_path(service.category, service)
        end

        def menu_food_path(food)
          controller.menu_food_path(food.category, food)
        end

        def link_to_office(value, options={})
          link_to(value, office_path, options)
        end

        def link_to_home(value, options={})
          link_to(value, home_path, default_class_options(home_page?, options))
        end

        def link_to_galleries(value, options={})
          link_to(value, galleries_path, default_class_options(galleries_page?, options))
        end

        def link_to_people(value, options={})
          link_to(value, people_path, default_class_options(people_page?, options))
        end

        def link_to_products(value, options={})
          link_to(value, products_path, default_class_options(products_page?, options))
        end

        def link_to_services(value, options={})
          link_to(value, services_path, default_class_options(services_page?, options))
        end

        def link_to_menu(value, options={})
          link_to(value, menu_path, default_class_options(menu_page?, options))
        end

        def link_to_announcements(value, options={})
          link_to(value, announcements_path, default_class_options(announcements_page?, options))
        end

        def link_to_brochures(value, options={})
          link_to(value, brochures_path, default_class_options(brochures_page?, options))
        end

        def link_to_map(value, options={})
          link_to(value, map_path, default_class_options(map_page?, options))
        end

        def link_to_about_us(value, options={})
          link_to(value, about_us_path, default_class_options(about_us_page?, options))
        end

        def link_to_contact_us(value, options={})
          link_to(value, contact_us_path, default_class_options(contact_us_page?, options))
        end

        private

          def default_class_options(is_current_page, options={})
            default_class_name = toggle_class_name('active', is_current_page)
            options['class']   = "#{default_class_name} #{options['class']}".strip
            options
          end

          def home_page?
            request.fullpath.split('?')[0] == home_path
          end

          def galleries_page?
            request.fullpath.start_with?(galleries_path)
          end

          def people_page?
            request.fullpath.start_with?(people_path)
          end

          def brochures_page?
            request.fullpath.start_with?(brochures_path)
          end

          def map_page?
            request.fullpath.start_with?(map_path)
          end

          def about_us_page?
            request.fullpath.start_with?(about_us_path)
          end

          def contact_us_page?
            request.fullpath.start_with?(contact_us_path)
          end

          def products_page?
            request.fullpath.start_with?(products_path)
          end

          def services_page?
            request.fullpath.start_with?(services_path)
          end

          def menu_page?
            request.fullpath.start_with?(menu_path)
          end

          def announcements_page?
            request.fullpath.start_with?(announcements_path)
          end

          def request
            controller.request
          end

          def controller
            @context.registers[:controller]
          end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::InstantWebsite::Liquid::UrlFilter