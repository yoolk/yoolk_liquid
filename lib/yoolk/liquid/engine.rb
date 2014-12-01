# models
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

module Yoolk
  module Liquid
    class Engine < ::Rails::Engine
      isolate_namespace Yoolk::Liquid

      config.i18n.fallbacks = [:en]
      config.i18n.load_path += Dir[root.join("config", "locales", "**", "*.{rb,yml}").to_s]
    end
  end
end