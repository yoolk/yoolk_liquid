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

                  :products_path,
                  :product_path,

                  :services_path,
                  :service_path,

                  :foods_path,
                  :food_path,

                  :announcements_path,
                  :announcement_path,

                  :brochures_path,

                  :map_path,
                  :about_us_path,
                  :contact_us_path,

                  to: :url_helpers

        def office_path
          '/office'
        end

        def home_path
          root_path
        end

        def link_to_office(value, options={})
          link_to(value, office_path, options)
        end

        def link_to_home(value, options={})
          link_to(value, home_path, default_class_options(home_path, options))
        end

        def link_to_galleries(value, options={})
          link_to(value, galleries_path, default_class_options(galleries_path, options))
        end

        def link_to_people(value, options={})
          link_to(value, people_path, default_class_options(people_path, options))
        end

        def link_to_products(value, options={})
          link_to(value, products_path, default_class_options(products_path, options))
        end

        def link_to_services(value, options={})
          link_to(value, services_path, default_class_options(services_path, options))
        end

        def link_to_foods(value, options={})
          link_to(value, foods_path, default_class_options(foods_path, options))
        end

        def link_to_announcements(value, options={})
          link_to(value, announcements_path, default_class_options(announcements_path, options))
        end

        def link_to_map(value, options={})
          link_to(value, map_path, default_class_options(map_path, options))
        end

        def link_to_about_us(value, options={})
          link_to(value, about_us_path, default_class_options(about_us_path, options))
        end

        def link_to_contact_us(value, options={})
          link_to(value, contact_us_path, default_class_options(contact_us_path, options))
        end

        private

          def url_helpers
            @url_helpers ||= Rails.application.routes.url_helpers
          end

          def default_class_options(current_path, options={})
            { 'class' => toggle_class_name('active', current_page?(current_path)) }.reverse_merge(options)
          end
      end
    end
  end
end

Liquid::Template.register_filter Yoolk::InstantWebsite::Liquid::UrlFilter