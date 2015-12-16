$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'unidom/visitor/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'unidom-visitor'
  spec.version     = ::Unidom::Visitor::VERSION
  spec.authors     = [ 'Topbit Du' ]
  spec.email       = [ 'topbit.du@gmail.com' ]
  spec.homepage    = 'https://github.com/topbitdu/unidom-visitor'
  spec.summary     = 'The Visitor domain model engine includes User, Guest, Administrator, and Password models.'
  spec.description = 'Unidom (UNIfied Domain Object Model) is a series of domain model engines. The Visitor domain model engine includes User, Guest, Administrator, and Password models.
Unidom (统一领域对象模型)是一系列的领域模型引擎。访问者领域模型引擎包括用户、游客、管理员和密码的模型。'
  spec.license     = 'MIT'

  spec.files = Dir[ '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc' ]

  spec.add_dependency 'rails', '~> 4.2.5'
  spec.add_dependency 'pg',    '~> 0'

end
