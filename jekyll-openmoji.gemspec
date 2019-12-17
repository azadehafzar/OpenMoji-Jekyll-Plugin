# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jekyll-openmoji/version"

Gem::Specification.new do |spec|
  spec.name = "jekyll-openmoji"
  spec.version = Jekyll::Emoji::VERSION
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Mohammad Mahdi Baghbani Pourvahid"]
  spec.email = "MahdiBaghbani@protonmail.com"
  spec.homepage = "https://gitlab.com/Azadeh-Afzar/Web-Development/OpenMoji-Jekyll-Plugin"
  spec.description = "OpenMoji emoji pack plugin for Jekyll with powerful
                      configuration options and support for various emoji image file
                      sources and extensions. in addition to OpenMoji emojis, you can
                      also configure it to use any available emoji sources."
  spec.summary = "OpenMoji emoji plugin for Jekyll"
  spec.licenses = "GPL-3.0"

  spec.files = `git ls-files -z`.split("\x0").reject { |f|
    f.match(%r!^(images|script|spec)/!)
  }
  spec.executables = spec.files.grep(%r!^bin/!) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r!^test/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.3.0"

  spec.add_dependency "html-pipeline", "~> 2.2"
  spec.add_dependency "html-pipeline-negarmoji", "~> 0.1.0"
  spec.add_dependency "jekyll", ">= 3.0", "< 5.0"
  spec.add_dependency "negarmoji", "~> 0.1.3"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-jekyll", "~> 0.10"
  spec.add_development_dependency "simplecov", "~> 0.17.0"
end
