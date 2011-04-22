require 'rake'
require 'rspec/core/rake_task'

task :default => :rspec
desc "run all examples"
RSpec::Core::RakeTask.new('rspec') do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = ['-c', '-f d']
end

