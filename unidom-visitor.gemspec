$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/visitor/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-visitor'
  spec.version     = Unidom::Visitor::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-visitor'
  spec.summary     = 'Unidom Visitor Domain Model Engine 访问者领域模型引擎'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Visitor domain model engine includes User, Guest, Administrator, and Password models. Unidom (统一领域对象模型)是一系列的领域模型引擎。访问者领域模型引擎包括用户、游客、管理员和密码的模型。'
  spec.license     = 'MIT'

  spec.files         = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md' ]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = [ 'lib' ]

  spec.add_dependency 'unidom-common', '~> 0.9'

end
