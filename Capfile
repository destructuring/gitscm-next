#!/usr/bin/env ruby

require 'alpha_omega/deploy'

# gitscm deploy
namespace :gitscm do
  task :migrate do
    run "cd #{deploy_release} && RAILS_ENV=#{dna["app_env"]} #{ruby_loader} bin/local-helper rake db:migrate"
    run "cd #{deploy_release} && RAILS_ENV=#{dna["app_env"]} #{ruby_loader} bin/local-helper rake local_index"
  end

  task :restart do
    if dna["node_env"] == "localdomain"
      run "#{deploy_release}/libexec/server #{application} reload"
    else
      run "sudo service #{application} reload"
    end
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

load 'config/deploy'
