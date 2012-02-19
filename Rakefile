require 'bundler'

#Bundler.require(:default,:development)

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do | spec |
				
  spec.pattern = 'spec/**/*_spec.rb'
end


task :test_setup do 
  unless ENV['COLONY_ENV']
    ENV['COLONY_ENV'] = 'test'
  end
end

task :test => [:test_setup, :spec]

task :default => [:test] 
