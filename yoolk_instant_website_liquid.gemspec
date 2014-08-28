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
  s.summary     = 'liquid filters and tags to be used inside Yoolk Instant Website'
  s.description = 'A Rails Engine that contains liquid filters and tags to be used inside Yoolk Instant Website'

  s.files       = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0.9'
end