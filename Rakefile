require 'rake'
require 'rspec/core/rake_task'
require 'bundler/setup'

require 'dotenv'
Dotenv.load

require 'covalence/spec_tasks'
require 'covalence/environment_tasks'
require 'covalence/packer_tasks'

ENV['ANSIBLE_ROOT_DIR'] ||= File.expand_path("ansible/", __dir__)
ENV['ANSIBLE_PLAYS_DIR'] ||= File.join(ENV['ANSIBLE_ROOT_DIR'], "plays")
ENV['ANSIBLE_ROLE_PATHS'] ||= Dir.glob("#{File.join(ENV['ANSIBLE_ROOT_DIR'], "roles")}/{archive,external,internal,archive,unifio-shared}/*").join(",")

task :serverspec => 'serverspec:all'
task :default => :serverspec

namespace :serverspec do
  targets = []
  Dir.glob('./serverspec/*').each do |dir|
    next unless File.directory?(dir)
    target = File.basename(dir)
    targets << target
  end

  task :all => targets

  targets.each do |target|
    desc "Run serverspec tests on #{target}"
    RSpec::Core::RakeTask.new("#{target.to_sym}") do |t|
      t.pattern = "serverspec/#{target}/*_spec.rb"
      t.rspec_opts = '--color --format documentation'
      t.verbose = true
    end
  end
end
