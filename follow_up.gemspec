# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'follow_up/version'

Gem::Specification.new do |spec|
  spec.name          = "follow_up"
  spec.version       = FollowUp::VERSION
  spec.authors       = ["Mike LaPeter, Duncan Miller"]
  spec.email         = ["opensourceportland@gmail.com"]
  spec.description   = "Generates simple follow up emails based on new users doing or not doing an action you define."
  spec.summary       = "This gem creates follow up email templates that you can customize and automatically send
                        to customer that you segment using standard Rails where queries."
  spec.homepage      = "https://www.github.com/opensourceportland/follow-up"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
