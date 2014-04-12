# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_doc_seed/version'

Gem::Specification.new do |spec|
  spec.name          = "google_doc_seed"
  spec.version       = GoogleDocSeed::VERSION
  spec.authors       = ["Daniel Leavitt"]
  spec.email         = ["daniel.leavitt@gmail.com"]
  spec.description   = %q{Pulls a Google Spreadsheet into a CSV}
  spec.summary       = %q{Pulls a Google Spreadsheet into a CSV}
  spec.homepage      = "https://github.com/dleavitt/google_doc_seed"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "google-api-client"
  spec.add_development_dependency "launchy"


  spec.add_dependency "google_drive", "~> 0.3.5"
end
