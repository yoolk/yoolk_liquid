require 'dotenv-rails'

# models
require 'rails-i18n'
require 'active_model'
require 'virtus'

# themes
require 'themes_on_rails'
require 'liquid-rails'
require 'assets-rails'

# views
require 'kaminari'
require 'uglifier'
require 'sass-rails'
require 'therubyracer'
require 'truncate_html'
require 'rails_autolink'

# sandbox
require 'oj'

module Yoolk
  module Liquid
    class Engine < ::Rails::Engine
      isolate_namespace Yoolk::Liquid

      config.assets.precompile += %w( yoolk/jquery.business-view-overlay.js )

      initializer 'yoolk_liquid.load_tags_and_filters' do
        Dir["#{Yoolk::Liquid::Engine.root}/app/{tags,filters}/**/*.rb"].each { |f| require f }
      end

      if defined?(FactoryGirl)
        initializer "factory_girl.set_factory_paths" do
          FactoryGirl.definition_file_paths = [
            Yoolk::Liquid::Engine.root.join('spec', 'factories')
          ]
        end
      end

      config.i18n.fallbacks = [:en]
      config.i18n.default_locale = :en
      config.i18n.enforce_available_locales = true
      config.i18n.load_path += Dir[root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    end
  end
end