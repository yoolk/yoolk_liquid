module Yoolk
  module Liquid
    module UrlFilter

      # These three belows use url_helpers to avoid conflict in the real app.
      def product_url(product)
        # ref
        category = if products_category_url?
          product.product_categories.detect { |c| c.id == request.params[:category_id] }
        end

        url_helpers.product_path(category, product, default_url_options)
      end

      def service_url(service)
        url_helpers.service_path(service.category, service, default_url_options)
      end

      def menu_url(food)
        food_category = food.category.uncategorized? ? nil : food.category
        url_helpers.menu_path(food_category, food, default_url_options)
      end

      def product_category_products_url(product_category)
        controller.product_category_products_path(product_category)
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

      # Returns the attachment (url, width, height) of any attachment objects
      # Usage:
      # For catalog_item, brochure, announcement, you don't need to pass attachment object.
      # {{ catalog_item | attachment_url: "medium" }}
      # {{ product.photos[0] | attachment_url: "medium" }}

      %w(url width height).each do |meta|
        define_method("attachment_#{meta}") do |object, style|
          return nil if object.nil?

          if object.respond_to?(:image)
            image = object.image

            if image.present? && image.is_a?(Yoolk::Liquid::AttachmentDrop)
              image.send(meta, style)
            end
          else
            object.send(meta, style)
          end
        end
      end

      def home_url
        root_path
      end

      def root_url
        root_path
      end

      def root_url?
        request_path == root_path.split('?')[0]
      end
      alias_method :home_url?, :root_url?

      def office_url
        office_path
      end

      def map_url
        map_index_path
      end

      def map_url?
        request.fullpath.start_with?(map_url.split('?')[0])
      end

      def reservation_url
        reservation_index_path
      end

      def reservation_url?
        request.fullpath.start_with?(reservation_url.split('?')[0])
      end

      def feedback_url
        feedback_index_path
      end

      def feedback_url?
        request.fullpath.start_with?(feedback_url.split('?')[0])
      end

      def galleries_url
        galleries_path
      end

      def galleries_url?
        request.fullpath.start_with?(galleries_url.split('?')[0])
      end

      def links_url
        links_path
      end

      def links_url?
        request.fullpath.start_with?(links_url.split('?')[0])
      end

      def people_url
        people_path
      end

      def people_url?
        request.fullpath.start_with?(people_url.split('?')[0])
      end

      def brochures_url
        brochures_path
      end

      def brochures_url?
        request.fullpath.start_with?(brochures_url.split('?')[0])
      end

      def products_url
        products_path
      end

      def products_url?
        controller.controller_path.start_with? 'products'
      end

      def products_category_url?
        controller.controller_path.start_with?('products') && controller.params[:category_id].present?
      end

      def catalogs_category_url?
        controller.controller_path.end_with? 'categories'
      end

      def products_all? # :nodoc:
        products_url == request.fullpath
      end

      def services_url
        services_path
      end

      def services_url?
        request.fullpath.start_with?(services_url.split('?')[0])
      end

      def services_all?
        services_url == request.fullpath
      end

      def menu_index_url
        menu_index_path
      end

      def menu_index_url?
        request.fullpath.split('?')[0] =~ /\/menu/
      end

      def foods_all?
        menu_index_url == request.fullpath
      end

      def announcements_url
        announcements_path
      end

      def announcements_url?
        request.fullpath.start_with?(announcements_url.split('?')[0])
      end

      def about_us_url
        about_us_path
      end

      def about_us_url?
        request.fullpath.start_with?(about_us_url.split('?')[0])
      end

      def contact_us_url
        contact_us_path
      end

      def contact_us_url?
        request.fullpath.start_with?(contact_us_url.split('?')[0])
      end

      def attachments_url
        attachments_path
      end

      def attachments_url?
        request.fullpath.start_with?(attachments_url.split('?')[0])
      end

      def videos_url
        videos_path
      end

      def videos_url?
        request.fullpath.start_with?(videos_url.split('?')[0])
      end

      def within(path, collection)
        catalogs_category_url? ? "/#{collection.prefix_path.concat(path)}" : path
      end

      private

        delegate  :root_path, :galleries_path, :people_path, :brochures_path, :map_index_path,
                  :products_path, :services_path, :menu_index_path, :announcements_path,
                  :about_us_path, :contact_us_path, :reservation_index_path, :feedback_index_path,
                  :links_path, :videos_path, :attachments_path,
                  to: :controller

        def office_path
          if @context['listing'].from_groow?
            if Rails.env.staging?
              'http://staging.groow.io/office'
            else
              'https://groow.io/office'
            end
          else
            '/office'
          end
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
