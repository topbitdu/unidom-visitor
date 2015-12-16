$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "visitor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "visitor"
  s.version     = Visitor::VERSION
  s.authors     = ["Topbit Du"]
  s.email       = ["topbit.du@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Visitor."
  s.description = "TODO: Description of Visitor."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "pg"
end
