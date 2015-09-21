# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'microformat_scraper/version'

Gem::Specification.new do |spec|
  spec.name          = "microformat_scraper"
  spec.version       = MicroformatScraper::VERSION
  spec.authors       = ["Matt Gillooly"]
  spec.email         = ["git@mattgillooly.com"]

  spec.summary       = %q{Microformat event scraper}
  spec.description   = %q{Scrape scheduled events from microformatted web pages}
  spec.homepage      = "http://pvdtechevents.com/"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'nokogiri'
  spec.add_dependency 'virtus', '~> 1.0'
  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
