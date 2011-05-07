$:.unshift(File.join(File.dirname(__FILE__), "..", "lib"))
gem 'moo'
require 'moo'
require 'rspec'

RSpec.configure do |c|
  c.alias_example_to(:they)
  c.color_enabled = true
  c.formatter = 'documentation'
end
