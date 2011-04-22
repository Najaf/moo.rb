lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'moo/version'
 
Gem::Specification.new do |s|
  s.name        = "moo"
  s.version     = Moo::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Najaf Ali"]
  s.email       = ["ali.najaf@gmail.com"]
  s.homepage    = ""
  s.summary     = "Moo API client library"
  s.description = "Moo API client library"
 
  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{bin,lib,data}/**/*") + %w(LICENSE README.mkd )
  s.require_path = 'lib'
end
