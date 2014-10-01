module Yoolk
  module Liquid
    module UrlFilter

      # These three belows use url_helpers to avoid conflict in the real app.
      def product_url(product)
        url_helpers.product_path(product.category, product, default_url_options)
      end

      def service_url(service)
        url_helpers.service_path(service.category, service, default_url_options)
      end

      def menu_food_url(food)
        url_helpers.menu_food_path(food.category, food, default_url_options)
      end

      def products_category_url(product_category)
        controller.products_category_path(product_category)
      end

      def services_category_url(service_category)
        controller.services_category_path(service_category)
      end

      def menu_category_url(food_category)
        controller.menu_category_path(food_category)
      end

      def gallery_url(gallery)
        controller.gallery_path(gallery)
      end

      def announcement_url(announcement)
        controller.announcement_path(announcement)
      end

      # Returns the attachment of any attachment objects
      # Usage:
      # For catalog_item, brochure, announcement, you don't need to pass attachment object.
      # {{ catalog_item | attachment_url: "medium" }}
      # {{ product.photos[0] | attachment_url: "medium" }}
      def attachment_url(object, style)
        if object.respond_to?(:image) && object.image.is_a?(Yoolk::Liquid::AttachmentDrop)
          object.image.url(style)
        else
          object.url(style)
        end
      end

      def link_to_office(value, options={})
        link_to(value, office_path, options)
      end

      def link_to_home(value, options={})
        link_to(value, root_path, default_class_options(home_page?, options))
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
        link_to(value, menu_index_path, default_class_options(menu_page?, options))
      end

      def link_to_announcements(value, options={})
        link_to(value, announcements_path, default_class_options(announcements_page?, options))
      end

      def link_to_brochures(value, options={})
        link_to(value, brochures_path, default_class_options(brochures_page?, options))
      end

      def link_to_map(value, options={})
        link_to(value, map_index_path, default_class_options(map_page?, options))
      end

      def link_to_about_us(value, options={})
        link_to(value, about_us_path, default_class_options(about_us_page?, options))
      end

      def link_to_contact_us(value, options={})
        link_to(value, contact_us_path, default_class_options(contact_us_page?, options))
      end

      def link_to_reservation(value, options={})
        link_to(value, reservation_index_path, default_class_options(reservation_page?, options))
      end

      def link_to_feedback(value, options={})
        link_to(value, feedback_index_path, default_class_options(feedback_page?, options))
      end

      private

        delegate  :root_path, :galleries_path, :people_path, :brochures_path, :map_index_path,
                  :about_us_path, :contact_us_path, :products_path, :services_path,
                  :menu_index_path, :menu_category_path, :announcements_path, :reservation_index_path,
                  :feedback_index_path,
                  to: :controller

        def office_path
          '/office'
        end

        def default_class_options(is_current_page, options={})
          default_class_name = toggle_class_name('active', is_current_page)
          options['class']   = "#{default_class_name} #{options['class']}".strip.presence || nil

          options
        end

        def home_page?
          request.fullpath.split('?')[0] == root_path
        end

        def galleries_page?
          request.fullpath.start_with?(galleries_path.split('?')[0])
        end

        def people_page?
          request.fullpath.start_with?(people_path.split('?')[0])
        end

        def brochures_page?
          request.fullpath.start_with?(brochures_path.split('?')[0])
        end

        def map_page?
          request.fullpath.start_with?(map_index_path.split('?')[0])
        end

        def about_us_page?
          request.fullpath.start_with?(about_us_path.split('?')[0])
        end

        def contact_us_page?
          request.fullpath.start_with?(contact_us_path.split('?')[0])
        end

        def products_page?
          request.fullpath.start_with?(products_path.split('?')[0])
        end

        def services_page?
          request.fullpath.start_with?(services_path.split('?')[0])
        end

        def menu_page?
          request.fullpath.start_with?(menu_index_path.split('?')[0])
        end

        def announcements_page?
          request.fullpath.start_with?(announcements_path.split('?')[0])
        end

        def reservation_page?
          request.fullpath.start_with?(reservation_index_path.split('?')[0])
        end

        def feedback_page?
          request.fullpath.start_with?(feedback_index_path.split('?')[0])
        end

        def request
          controller.request
        end

        def controller
          @context.registers[:controller]
        end

        def default_url_options
          controller.default_url_options
        end

        def url_helpers
          Rails.application.routes.url_helpers
        end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::UrlFilter