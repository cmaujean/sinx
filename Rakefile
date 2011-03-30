require 'cucumber'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
  t.verbose = false
end

desc "Run all features"
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = "features --format pretty"
end