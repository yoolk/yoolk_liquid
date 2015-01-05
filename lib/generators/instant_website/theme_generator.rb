require 'rails/generators/base'

module InstantWebsite
  module Generators
    class ThemeGenerator < ::Rails::Generators::Base
      source_root   File.expand_path("../templates", __FILE__)
      argument      :theme_name, type: :string
      class_option  :theme_directory, type: :string, default: 'app/themes', desc: 'Theme Directory'
      desc          "Generates a new blank theme"

     def create_theme_directory
        empty_directory theme_views_layout
        empty_directory theme_images_directory
        empty_directory theme_javascripts_directory
        empty_directory theme_stylesheets_directory
        empty_directory theme_locales_directory
        create_file     "#{theme_images_directory}/.gitkeep", nil
        create_file     "#{theme_locales_directory}/.gitkeep", nil
      end

      def copy_manifest_files
        copy_file       "all.js.coffee",  "#{theme_javascripts_directory}/all.js.coffee"
        copy_file       "all.scss",       "#{theme_stylesheets_directory}/all.scss"
      end

      def copy_layout_file
        template "layout.liquid", "#{theme_views_layout}/#{theme_name}.liquid"
      end

      private

        def theme_directory
          "#{options.theme_directory}/#{theme_name}"
        end

        def theme_views_layout
          "#{theme_directory}/views/layouts"
        end

        def theme_images_directory
          "#{theme_directory}/assets/images/#{theme_name}"
        end

        def theme_javascripts_directory
          "#{theme_directory}/assets/javascripts/#{theme_name}"
        end

        def theme_stylesheets_directory
          "#{theme_directory}/assets/stylesheets/#{theme_name}"
        end

        def theme_locales_directory
          "#{theme_directory}/locales"
        end
    end
  end
end