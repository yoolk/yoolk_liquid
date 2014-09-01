$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'yoolk/instant_website/liquid/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'yoolk_instant_website_liquid'
  s.version     = Yoolk::InstantWebsite::Liquid::VERSION
  s.authors     = ['Chamnap Chhorn']
  s.email       = ['chamnapchhorn@gmail.com']
  s.homepage    = 'https://github.com/yoolk/yoolk_instant_website_liquid'
  s.summary     = 'Liquid filters and tags to be used inside Yoolk Instant Website'
  s.description = 'A Rails Engine that contains liquid filters and tags to be used inside Yoolk Instant Website'

  s.files       = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails',           '~> 4.0.9'
  s.add_dependency 'uglifier',        '>= 1.3.0'
  s.add_dependency 'sass-rails',      '~> 4.0.2'
  s.add_dependency 'bootstrap-sass',  '~> 3.2.0'
  s.add_dependency 'therubyracer',    '~> 0.12.1'
  s.add_dependency 'jquery-rails',    '~> 3.0.4'
end