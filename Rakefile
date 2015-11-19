require 'rubygems'
PROJECT_ROOT = File.expand_path("../", __FILE__)

# Set up gems listed in the Gemfile.
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('./Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'active_support/all'

desc "Deploy project"
task :deploy do
  puts "Deploying"
  system("middleman build --verbose")

  system("divshot push")

  system("divshot promote development production")

  # run deploy command
  # show a growl alert afterwards
end
