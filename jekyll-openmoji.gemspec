# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-openmoji/version"

Gem::Specification.new do |s|
  s.name        = "jekyll-openmoji"
  s.summary     = "OpenMoji emoji plugin for Jekyll"
  s.version     = Jekyll::JekyllOpenMoji::VERSION
  s.authors     = ["Mohammad Mahdi Baghbani Pourvahid"]
  s.email       = "MahdiBaghbani@protonmail.com"

  s.homepage = "https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin"
  s.licenses = ["GPL-3.0"]
  s.files    = ["lib/jekyll-openmoji.rb"]

  s.required_ruby_version = ">= 2.3.0"

  s.add_dependency "gemoji", "~> 3.0"
  s.add_dependency "html-pipeline", "~> 2.2"
  s.add_dependency "jekyll", ">= 3.0", "< 5.0"
  s.add_dependency "negarmoji", "~> 0.1.0"

  s.add_development_dependency "bundler", "~> 2.0"
  s.add_development_dependency "rake", "~> 12.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rubocop-jekyll", "~> 0.4"
end
