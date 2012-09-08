#!/usr/bin/env ruby

require 'alpha_omega/deploy'
load 'config/deploy'

# gitscm deploy
namespace :gitscm do
  task :migrate do
    run "cd #{deploy_release} && RAILS_ENV=#{master} #{ruby_loader} bin/local-helper rake db:migrate"
    run "cd #{deploy_release} && RAILS_ENV=#{master} #{ruby_loader} bin/local-helper bundle exec rake local_index"
  end

  task :restart do
    run "sudo service #{application} reload"
  end
end

# hooks into alpha_omega deploy
after "deploy:cook", "microwave:cook"
after "microwave:cook", "gitscm:migrate"
after "deploy:restart", "gitscm:restart"

# interesting hosts
Deploy self, __FILE__ do |admin, node| 
  { :deploy => { } }
end
