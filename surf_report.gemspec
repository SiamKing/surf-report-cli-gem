# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'surf_report/version'

Gem::Specification.new do |spec|
  spec.name          = "surf_report"
  spec.version       = SurfReport::VERSION
  spec.authors       = ["SiamKing"]
  spec.email         = ["thesiameseelectric@gmail.com"]

  spec.summary       = %q{Waves in Los Angeles}
  spec.description   = %q{Waves in Los Angeles}
  spec.homepage      = "https://github.com/SiamKing/surf-report-cli-gem"
  spec.license       = "MIT"


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["surf-report"]          #spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "lib/surf_report"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize"
end
