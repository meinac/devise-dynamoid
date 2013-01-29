# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise-dynamoid/version"

Gem::Specification.new do |s|
  s.name        = "devise-dynamoid"
  s.version     = Dynamoid::Devise::VERSION
  s.date        = "2013-01-29"
  s.summary     = %Q{Support for using Dynamoid ORM with devise}
  s.description = %Q{devise-dynamoid adds Dynamoid support to devise (http://github.com/plataformatec/devise) for authentication support for Rails}
  s.email       = "teo@macteo.it"
  s.homepage    = "http://github.com/macteo/devise-dynamoid"
  s.authors     = ["Matteo Gavagnin","Kristian Mandrup"]
  s.files       = Dir.glob("lib/**/*") + %w(Changelog.txt devise-dynamoid.gemspec Gemfile LICENSE Rakefile README.markdown)
  s.test_files  = Dir.glob("test/**/*")

  s.add_dependency 'dynamoid', '>= 0.6'
  s.add_dependency 'devise', '>= 2.0'
  s.add_dependency "SystemTimer", "~> 1.2" if RUBY_VERSION < "1.9"
end
