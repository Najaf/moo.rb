$:.unshift File.join(File.dirname(__FILE__),'lib')
require 'moo'

task :default => :test

task :test do
end
