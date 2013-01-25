$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid/ordered/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_ordered"
  s.version     = Mongoid::Ordered::VERSION
  s.authors     = ["Meredith Lesly"]
  s.email       = ["meredith@xoala.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MongoidOrdered."
  s.description = "TODO: Description of MongoidOrdered."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "mongoid", "~> 3.0"
  s.add_runtime_dependency 'rspec'
end
