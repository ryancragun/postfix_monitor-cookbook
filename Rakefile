require 'bundler/setup'

desc 'Run RSpec unit tests'
task :unit do
  sh 'rm -rf test/cookbooks'
  sh 'berks install --path test/cookbooks'
  sh 'bundle exec rspec test/cookbooks'
  sh 'rm -rf test/cookbooks'
end

require 'rubocop/rake_task'
desc 'Run Rubocop style checks'
Rubocop::RakeTask.new(:style)

require 'foodcritic'
require 'foodcritic/rake_task'
FoodCritic::Rake::LintTask.new

desc 'Run All'
task :default => %w(style foodcritic unit)
