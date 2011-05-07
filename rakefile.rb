require 'rake'
require 'rspec/core/rake_task'
require 'moo'

gem_version = '0.0.1'
gem_filename = 'moo-' + gem_version + '.gem'

task :default => :rspec
desc "run all examples"

RSpec::Core::RakeTask.new('rspec') do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task :build do
  sh 'gem uninstall moo'
  sh 'gem build moo.gemspec'
  sh 'gem install ' + gem_filename
  sh 'rm ' + gem_filename
end


