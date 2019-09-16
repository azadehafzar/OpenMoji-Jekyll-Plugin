# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-openmoji"

Gem::Specification.new do |gem|
  gem.name        = "jekyll-openmoji"
  gem.version     = Jekyll::JekyllOpenMoji::VERSION
  gem.platform    = Gem::Platform::RUBY
  gem.authors     = ["Mohammad Mahdi Baghbani Pourvahid"]
  gem.email       = "MahdiBaghbani@protonmail.com"
  gem.homepage    = "https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin"
  gem.description = "%(OpenMoji emoji pack plugin for Jekyll with a powerful configuration options
                     and support for various emoji image file sorces and extensions)"
  gem.summary     = "OpenMoji emoji plugin for Jekyll"
  gem.licenses    = "GPL-3.0"
  gem.files = Dir[
      "README.md",
      "LICENSE",
      "lib/jekyll-openmoji.rb",
  ]

  gem.required_ruby_version = ">= 2.3.0"

  gem.add_dependency "gemoji", "~> 3.0"
  gem.add_dependency "html-pipeline", "~> 2.2"
  gem.add_dependency "jekyll", ">= 3.0", "< 5.0"
  gem.add_dependency "negarmoji", "~> 0.1.0"

  gem.add_development_dependency "bundler", "~> 2.0"
  gem.add_development_dependency "rake", "~> 12.0"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "rubocop-jekyll", "~> 0.4"
  gem.add_development_dependency "simplecov", "~> 0.17.0"
end
