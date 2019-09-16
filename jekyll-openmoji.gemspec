# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name        = "jekyll-openmoji"
  spec.version     = "0.0.2"
  spec.platform    = Gem::Platform::RUBY
  spec.authors     = ["Mohammad Mahdi Baghbani Pourvahid"]
  spec.email       = "MahdiBaghbani@protonmail.com"
  spec.homepage    = "https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin"
  spec.description = "%(OpenMoji emoji pack plugin for Jekyll with a powerful configuration options
                     and support for various emoji image file sources and extensions)"
  spec.summary     = "OpenMoji emoji plugin for Jekyll"
  spec.licenses    = "GPL-3.0"
  spec.files = Dir[
      "lib/*.rb",
      "LICENSE",
      "*.md",
  ]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "gemoji", "~> 3.0"
  spec.add_dependency "html-pipeline", "~> 2.2"
  spec.add_dependency "jekyll", ">= 3.0", "< 5.0"
  spec.add_dependency "negarmoji", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.4"
  spec.add_development_dependency "simplecov", "~> 0.17.0"
end
