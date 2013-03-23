# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'koda-auth-omniauth/version'

Gem::Specification.new do |s|
  s.name        = "koda-auth-omniauth"
  s.version     = Koda::Auth::OmniAuth::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Marcel du Prez", "Derek Ekins"]
  s.email       = ["marceldupr@gmail.com", "derek@spathi.com"]
  s.homepage    = "https://github.com/KodaFramework"
  s.summary     = "Koda Authorisation OmniAuth - authorisation for koda"
  s.description = "Koda Authorisation OmniAuth - authorisation for koda"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_dependency 'omniauth'
  s.add_dependency 'omniauth-github'
  s.add_dependency 'sinatra'
  s.add_dependency 'koda-content'

  s.add_development_dependency 'rspec', '>= 2.8'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'rake'

  s.files        = Dir.glob("{lib}/**/*")
  s.require_path = 'lib'
end