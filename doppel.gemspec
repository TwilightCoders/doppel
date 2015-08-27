$LOAD_PATH.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'doppel/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'doppel'
  s.version     = Doppel::VERSION
  s.authors     = ['Dale Stevens']
  s.email       = ['dale@twilightcoders.net']
  s.homepage    = 'http://github.com/TwilightCoders/doppel'
  s.summary     = 'Provides convenient scopes for finding duplicate records.'
  s.description = 'Provides convenient scopes for finding duplicate records.'
  s.license     = 'MIT'

  s.files = Dir["{app,config,db,lib}/**/*", 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 4.2'

  s.add_development_dependency 'sqlite3'
end
