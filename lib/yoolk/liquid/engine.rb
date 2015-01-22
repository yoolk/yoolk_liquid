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

# sandbox
require 'oj'
require 'truncate_html'

module Yoolk
  module Liquid
    class Engine < ::Rails::Engine
      isolate_namespace Yoolk::Liquid

      config.i18n.fallbacks = [:en]
      config.i18n.default_locale = :en
      config.i18n.enforce_available_locales = true
      config.i18n.load_path += Dir[root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    end
  end
end