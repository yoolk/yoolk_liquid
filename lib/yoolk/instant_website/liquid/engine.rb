require 'liquid-rails'
require 'themes_on_rails'
require 'uglifier'
require 'sass-rails'
require 'bootstrap-sass'
require 'therubyracer'
require 'jquery-rails'

module Yoolk
  module InstantWebsite
    module Liquid
      class Engine < ::Rails::Engine
        isolate_namespace Yoolk::InstantWebsite::Liquid
      end
    end
  end
end
