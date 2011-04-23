lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
Gem::Specification.new do |s|
  s.name        = "moo"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Najaf Ali"]
  s.email       = ["ali.najaf@gmail.com"]
  s.homepage    = "http://example.com"
  s.summary     = "Moo API client library"
  s.description = "Simple ruby library for creating and printing stuff at moo.com"
 
  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec"
 
  s.files        = Dir.glob("{bin,lib,data}/**/*") + %w(LICENSE README.mkd )
  s.require_path = 'lib'
end
