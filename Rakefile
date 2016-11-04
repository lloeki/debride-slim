require 'bundler/gem_helper'
Bundler::GemHelper.install_tasks

require 'rubocop/rake_task'
RuboCop::RakeTask.new

require 'reek/rake/task'
Reek::Rake::Task.new do |t|
  t.fail_on_error = false
end

require 'rake/testtask'
Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

task default: [:test, :rubocop, :reek]
