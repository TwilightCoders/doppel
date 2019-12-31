# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'doppel/version'

Gem::Specification.new do |spec|
  spec.name          = "doppel"
  spec.version       = Doppel::VERSION
  spec.authors       = ["Dale Stevens"]
  spec.email         = ["dale@twilightcoders.net"]

  spec.summary       = %q{Find exact and similar records}
  # spec.description   = %q{Gives ActiveRecord support for PostgreSQL's native inherited tables}
  spec.homepage      = "https://github.com/twilightcoders/doppel"
  spec.license       = "MIT"

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0")
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib', 'spec']

  rails_versions = '>= 4.0'
  spec.required_ruby_version = '>= 2.0'

  spec.add_runtime_dependency 'pg', '~> 0'
  spec.add_runtime_dependency 'activerecord', rails_versions

  spec.add_development_dependency 'pry-byebug', '~> 3'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'combustion', '~> 0.7'

end
