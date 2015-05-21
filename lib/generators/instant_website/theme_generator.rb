require 'rails/generators/base'

module InstantWebsite
  module Generators
    class ThemeGenerator < ::Rails::Generators::Base
      source_root   File.expand_path('../templates', __FILE__)
      argument      :theme_name,      type: :string
      class_option  :theme_directory, type: :string, default: 'yoolk_themes',      desc: 'Theme Directory'
      class_option  :pages,           type: :string, default: 'home,contact_us', desc: 'Available pages: about_us,announcements,brochures,contact_us,feedback,galleries,home,map,menu,people,products,reservation,services'

      desc          'Generates a new blank theme'

      def create_assets_images
        empty_directory image_dir
        create_file     "#{image_dir}/.gitkeep", nil
      end

      def create_assets_javascript
        empty_directory js_dir
        empty_directory "#{js_dir}/widgets"
        empty_directory "#{js_dir}/views"
        create_file     "#{js_dir}/views/application_view.coffee", nil
        copy_file       'all.js.coffee', "#{js_dir}/all.js.coffee"
      end


      def create_assets_stylesheets
        empty_directory css_dir
        copy_file       'all.scss', "#{css_dir}/all.scss"
      end

      def create_locales
        empty_directory locale_dir
        template        'locales/km.yml',  "#{locale_dir}/km.yml"
        template        'locales/en.yml',  "#{locale_dir}/en.yml"
        template        'locales/id.yml',  "#{locale_dir}/id.yml"
        template        'locales/th.yml',  "#{locale_dir}/th.yml"
        template        'locales/vi.yml',  "#{locale_dir}/vi.yml"
        create_file     "#{locale_dir}/.gitkeep",  nil
      end

      def create_views
        empty_directory layout_dir
        template        'layout.liquid',  "#{layout_dir}/#{theme_name}.liquid"
      end

      def create_pages
        create_about_us       if pages.include?('about_us')
        create_announcements  if pages.include?('announcements')
        create_attachments    if pages.include?('attachments')
        create_brochures      if pages.include?('brochures')
        create_contact_us     if pages.include?('contact_us')
        create_feedback       if pages.include?('feedback')
        create_galleries      if pages.include?('galleries')
        create_home           if pages.include?('home')
        create_links          if pages.include?('links')
        create_map            if pages.include?('map')
        create_menu           if pages.include?('menu')
        create_people         if pages.include?('people')
        create_products       if pages.include?('products')
        create_reservation    if pages.include?('reservation')
        create_services       if pages.include?('services')
        create_videos         if pages.include?('videos')
      end

      private

        def theme_directory
          "#{options.theme_directory}/#{theme_name}"
        end

        def image_dir
          @image_dir ||= "#{theme_directory}/assets/images/#{theme_name}"
        end

        def js_dir
          @js_dir   ||= "#{theme_directory}/assets/javascripts/#{theme_name}"
        end

        def css_dir
          @css_dir ||= "#{theme_directory}/assets/stylesheets/#{theme_name}"
        end

        def locale_dir
          @locale_dir ||= "#{theme_directory}/locales"
        end

        def layout_dir
          @layout_dir ||= "#{theme_directory}/views/layouts"
        end

        def theme_views_directory
          "#{theme_directory}/views"
        end

        def theme_views_home_directory
          "#{theme_views_directory}/home"
        end

        def theme_views_links_directory
          "#{theme_views_directory}/links"
        end

        def theme_views_contact_us_directory
          "#{theme_views_directory}/contact_us"
        end

        def theme_views_about_us_directory
          "#{theme_views_directory}/about_us"
        end

        def theme_views_announcements_directory
          "#{theme_views_directory}/announcements"
        end

        def theme_views_attachments_directory
          "#{theme_views_directory}/attachments"
        end

        def theme_views_brochures_directory
          "#{theme_views_directory}/brochures"
        end

        def theme_views_feedback_directory
          "#{theme_views_directory}/feedback"
        end

        def theme_views_galleries_directory
          "#{theme_views_directory}/galleries"
        end

        def theme_views_map_directory
          "#{theme_views_directory}/map"
        end

        def theme_views_menu_directory
          "#{theme_views_directory}/menu"
        end

        def theme_views_menu_foods_directory
          "#{theme_views_menu_directory}/foods"
        end

        def theme_views_menu_categories_directory
          "#{theme_views_menu_directory}/categories"
        end

        def theme_views_people_directory
          "#{theme_views_directory}/people"
        end

        def theme_views_products_directory
          "#{theme_views_directory}/products"
        end

        def theme_views_products_categories_directory
          "#{theme_views_products_directory}/categories"
        end

        def theme_views_reservation_directory
          "#{theme_views_directory}/reservation"
        end

        def theme_views_services_directory
          "#{theme_views_directory}/services"
        end

        def theme_views_services_categories_directory
          "#{theme_views_services_directory}/categories"
        end

        def theme_views_videos_directory
          "#{theme_views_directory}/videos"
        end

        def pages
          options.pages.split(',')
        end

        def create_home
          empty_directory theme_views_home_directory
          create_file     "#{theme_views_home_directory}/index.liquid",       "<h1>Home#index</h1>\n<p>Find me in #{theme_views_home_directory}/index.liquid"
        end

        def create_links
          empty_directory theme_views_links_directory
          create_file     "#{theme_views_links_directory}/index.liquid",       "<h1>Links#index</h1>\n<p>Find me in #{theme_views_links_directory}/index.liquid"
        end

        def create_contact_us
          empty_directory theme_views_contact_us_directory
          create_file     "#{theme_views_contact_us_directory}/index.liquid", "<h1>ContactUs#index</h1>\n<p>Find me in #{theme_views_contact_us_directory}/index.liquid"
        end

        def create_about_us
          empty_directory theme_views_about_us_directory
          create_file     "#{theme_views_about_us_directory}/index.liquid", "<h1>AboutUs#index</h1>\n<p>Find me in #{theme_views_about_us_directory}/index.liquid"
        end

        def create_announcements
          empty_directory theme_views_announcements_directory
          create_file     "#{theme_views_announcements_directory}/index.liquid", "<h1>Announcements#index</h1>\n<p>Find me in #{theme_views_announcements_directory}/index.liquid"
          create_file     "#{theme_views_announcements_directory}/show.liquid", "<h1>Announcements#show</h1>\n<p>Find me in #{theme_views_announcements_directory}/show.liquid"
        end

        def create_attachments
          empty_directory theme_views_attachments_directory
          create_file     "#{theme_views_attachments_directory}/index.liquid", "<h1>Attachments#index</h1>\n<p>Find me in #{theme_views_attachments_directory}/index.liquid"
        end

        def create_brochures
          empty_directory theme_views_brochures_directory
          create_file     "#{theme_views_brochures_directory}/index.liquid", "<h1>Brochures#index</h1>\n<p>Find me in #{theme_views_brochures_directory}/index.liquid"
        end

        def create_feedback
          empty_directory theme_views_feedback_directory
          create_file     "#{theme_views_feedback_directory}/index.liquid", "<h1>Feedback#index</h1>\n<p>Find me in #{theme_views_feedback_directory}/index.liquid"
        end

        def create_galleries
          empty_directory theme_views_galleries_directory
          create_file     "#{theme_views_galleries_directory}/index.liquid", "<h1>Galleries#index</h1>\n<p>Find me in #{theme_views_galleries_directory}/index.liquid"
          create_file     "#{theme_views_galleries_directory}/show.liquid", "<h1>Galleries#show</h1>\n<p>Find me in #{theme_views_galleries_directory}/show.liquid"
        end

        def create_map
          empty_directory theme_views_map_directory
          create_file     "#{theme_views_map_directory}/index.liquid", "<h1>Map#index</h1>\n<p>Find me in #{theme_views_map_directory}/index.liquid"
        end

        def create_menu
          empty_directory theme_views_menu_directory
          empty_directory theme_views_menu_foods_directory
          empty_directory theme_views_menu_categories_directory
          create_file     "#{theme_views_menu_directory}/index.liquid", "<h1>Menu#index</h1>\n<p>Find me in #{theme_views_menu_directory}/index.liquid"
          create_file     "#{theme_views_menu_foods_directory}/show.liquid", "<h1>Menu/Foods#show</h1>\n<p>Find me in #{theme_views_menu_foods_directory}/show.liquid"
          create_file     "#{theme_views_menu_categories_directory}/show.liquid", "<h1>Menu/Categories#show</h1>\n<p>Find me in #{theme_views_menu_categories_directory}/show.liquid"
        end

        def create_people
          empty_directory theme_views_people_directory
          create_file     "#{theme_views_people_directory}/index.liquid", "<h1>People#index</h1>\n<p>Find me in #{theme_views_people_directory}/index.liquid"
        end

        def create_products
          empty_directory theme_views_products_directory
          empty_directory theme_views_products_categories_directory
          create_file     "#{theme_views_products_directory}/index.liquid", "<h1>Products#index</h1>\n<p>Find me in #{theme_views_products_directory}/index.liquid"
          create_file     "#{theme_views_products_directory}/show.liquid", "<h1>Products#show</h1>\n<p>Find me in #{theme_views_products_directory}/show.liquid"
          create_file     "#{theme_views_products_categories_directory}/show.liquid", "<h1>Products/Categories#show</h1>\n<p>Find me in #{theme_views_products_categories_directory}/show.liquid"
        end

        def create_reservation
          empty_directory theme_views_reservation_directory
          create_file     "#{theme_views_reservation_directory}/index.liquid", "<h1>Reservation#index</h1>\n<p>Find me in #{theme_views_reservation_directory}/index.liquid"
        end

        def create_services
          empty_directory theme_views_services_directory
          empty_directory theme_views_services_categories_directory
          create_file     "#{theme_views_services_directory}/index.liquid", "<h1>Services#index</h1>\n<p>Find me in #{theme_views_services_directory}/index.liquid"
          create_file     "#{theme_views_services_directory}/show.liquid", "<h1>Services#show</h1>\n<p>Find me in #{theme_views_services_directory}/show.liquid"
          create_file     "#{theme_views_services_categories_directory}/show.liquid", "<h1>Services/Categories#show</h1>\n<p>Find me in #{theme_views_services_categories_directory}/show.liquid"
        end

        def create_videos
          empty_directory theme_views_videos_directory
          create_file     "#{theme_views_videos_directory}/index.liquid", "<h1>Videos#index</h1>\n<p>Find me in #{theme_views_videos_directory}/index.liquid"
        end
    end
  end
end