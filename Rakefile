require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/extensiontask'

RSpec::Core::RakeTask.new(:spec)

gemspec = eval(File.read('consistent_hash.gemspec'))

Rake::ExtensionTask.new('consistent_hash', gemspec)

task default: %i(compile spec)
