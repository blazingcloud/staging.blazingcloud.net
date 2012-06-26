require 'rspec/core'
require 'rspec/core/rake_task'

task :default => :spec

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec)

namespace :deploy do
  desc "Pushes changes in development to staging"
  task :staging do
    system('git checkout staging')
    pulled = system('git pull origin master')
    if pulled
      puts 'success!'
      system('git push heroku master')
      system('git checkout master')
      puts 'Deployed to Staging'
    else
      puts "Not deployed"
      exit
    end
  end
  
  desc "Pushes changes in staging to production"
  task :production do
    puts 'Deploying to Production, are you sure? (yes, no)'
    answer = STDIN.gets.chomp.strip
    while (answer != 'yes' && answer != 'no')
      puts 'Please type "yes" or "no"'
      answer = STDIN.gets.chomp.strip
    end
    
    if answer == 'yes'
      system('git checkout staging')
      pulled = system('git pull heroku master')
      if pulled
        system('git push production master')
        system('git checkout master')
        puts 'Deployed to Production'
      else
        puts "Not deployed"
        exit
      end
    elsif answer == 'no'
      puts "Not deployed"
    end
  end
end