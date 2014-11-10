# models
require 'active_model'
require 'virtus'

# views
require 'kaminari'
require 'liquid-rails'
require 'themes_on_rails'
require 'uglifier'
require 'sass-rails'
require 'therubyracer'
require 'jquery-rails'

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