require 'liquid-rails'
require 'themes_on_rails'
require 'uglifier'
require 'sass-rails'
require 'bootstrap-sass'
require 'therubyracer'
require 'jquery-rails'

require 'virtus'
require 'oj'

module Yoolk
  module Liquid
    class Engine < ::Rails::Engine
      isolate_namespace Yoolk::Liquid
    end
  end
end