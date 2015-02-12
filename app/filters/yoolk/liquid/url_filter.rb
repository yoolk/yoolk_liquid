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
        return nil if object.nil?

        if object.respond_to?(:image)
          image = object.image

          if image.present? && image.is_a?(Yoolk::Liquid::AttachmentDrop)
            image.url(style)
          end
        else
          object.url(style)
        end
      end

      def link_to_office(value, options={})
        link_to(value, office_path, options.merge({rel: "nofollow"}))
      end

      def link_to_home(value, options={})
        link_to(value, root_path, default_class_options(root_url?, options))
      end
      alias_method :link_to_root, :link_to_home

      def link_to_galleries(value, options={})
        link_to(value, galleries_path, default_class_options(galleries_url?, options))
      end

      def link_to_people(value, options={})
        link_to(value, people_path, default_class_options(people_url?, options))
      end

      def link_to_products(value, options={})
        link_to(value, products_path, default_class_options(products_url?, options))
      end

      def link_to_services(value, options={})
        link_to(value, services_path, default_class_options(services_url?, options))
      end

      def link_to_menu(value, options={})
        link_to(value, menu_index_path, default_class_options(menu_url?, options))
      end

      def link_to_announcements(value, options={})
        link_to(value, announcements_path, default_class_options(announcements_url?, options))
      end

      def link_to_brochures(value, options={})
        link_to(value, brochures_path, default_class_options(brochures_url?, options))
      end

      def link_to_links(value, options={})
        link_to(value, links_path, default_class_options(links_url?, options))
      end

      def link_to_videos(value, options={})
        link_to(value, videos_path, default_class_options(videos_url?, options))
      end

      def link_to_attachments(value, options={})
        link_to(value, attachments_path, default_class_options(attachments_url?, options))
      end

      def link_to_map(value, options={})
        link_to(value, map_index_path, default_class_options(map_url?, options))
      end

      def link_to_about_us(value, options={})
        link_to(value, about_us_path, default_class_options(about_us_url?, options))
      end

      def link_to_contact_us(value, options={})
        link_to(value, contact_us_path, default_class_options(contact_us_url?, options))
      end

      def link_to_reservation(value, options={})
        link_to(value, reservation_index_path, default_class_options(reservation_url?, options))
      end

      def link_to_feedback(value, options={})
        link_to(value, feedback_index_path, default_class_options(feedback_url?, options))
      end

      def link_to_sign_in(value)
        link_to value, office_path, rel: 'nofollow'
      end

      def root_url?
        request_path == root_path.split('?')[0]
      end
      alias_method :home_url?, :root_url?

      def galleries_url?
        request.fullpath.start_with?(galleries_path.split('?')[0])
      end

      def people_url?
        request.fullpath.start_with?(people_path.split('?')[0])
      end

      def brochures_url?
        request.fullpath.start_with?(brochures_path.split('?')[0])
      end

      def map_url?
        request.fullpath.start_with?(map_index_path.split('?')[0])
      end

      def about_us_url?
        request.fullpath.start_with?(about_us_path.split('?')[0])
      end

      def contact_us_url?
        request.fullpath.start_with?(contact_us_path.split('?')[0])
      end

      def products_url?
        request.fullpath.start_with?(products_path.split('?')[0])
      end

      def services_url?
        request.fullpath.start_with?(services_path.split('?')[0])
      end

      def menu_url?
        request.fullpath.start_with?(menu_index_path.split('?')[0])
      end

      def announcements_url?
        request.fullpath.start_with?(announcements_path.split('?')[0])
      end

      def reservation_url?
        request.fullpath.start_with?(reservation_index_path.split('?')[0])
      end

      def feedback_url?
        request.fullpath.start_with?(feedback_index_path.split('?')[0])
      end

      def links_url?
        request.fullpath.start_with?(links_path.split('?')[0])
      end

      def videos_url?
        request.fullpath.start_with?(videos_path.split('?')[0])
      end

      def attachments_url?
        request.fullpath.start_with?(attachments_path.split('?')[0])
      end

      private

        delegate  :root_path, :galleries_path, :people_path, :brochures_path, :map_index_path,
                  :products_path, :services_path, :menu_index_path, :announcements_path,
                  :about_us_path, :contact_us_path, :reservation_index_path, :feedback_index_path,
                  :links_path, :videos_path, :attachments_path,
                  to: :controller

        def office_path
          '/office'
        end

        def default_class_options(is_current_page, options={})
          default_class_name = toggle_class_name('active', is_current_page)
          options['class']   = "#{default_class_name} #{options['class']}".strip.presence || nil

          options
        end

        def request
          controller.request
        end

        def request_path
          request.fullpath.split('?')[0]
        end

        def controller
          @context.registers[:controller]
        end

        def default_url_options
          controller.send(:default_url_options)
        end

        def url_helpers
          Rails.application.routes.url_helpers
        end
    end
  end
end

Liquid::Template.register_filter Yoolk::Liquid::UrlFilter