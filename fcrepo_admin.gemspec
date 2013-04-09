$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "fcrepo_admin/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "fcrepo_admin"
  s.version     = FcrepoAdmin::VERSION
  s.authors     = ["David Chandek-Stark", "Jim Coble", "Chris Beer", "Justin Coyne"]
  s.email       = ["hydra-tech@googlegroups.com"]
  s.homepage    = "http://projecthydra.org"
  s.summary     = "Hydra-based Fedora Commons repository admin tool."
  s.description = "A Rails engine for administrative access to a Fedora Commons repository based on the Hydra Project repository application framework."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "hydra-head", "6.0.0"
  s.add_dependency "blacklight"
  s.add_dependency "rails", "~> 3.2"
  s.add_dependency "mime-types", '~> 1.19'

  s.add_development_dependency "devise"
  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "jettywrapper"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "bootstrap-sass"
end