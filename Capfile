#!/usr/bin/env ruby

require 'alpha_omega/deploy'
load 'config/deploy'

# gitscm deploy
namespace :gitscm do
  task :migrate do
    run "cd #{deploy_release} && RAILS_ENV=#{dna["app_env"]} #{ruby_loader} bin/local-helper rake db:migrate"
    run "cd #{deploy_release} && RAILS_ENV=#{dna["app_env"]} #{ruby_loader} bin/local-helper rake local_index"
  end

  task :restart do
    service_dir=deploy_release
    service_loader="libexec/server"
    run "cd #{service_dir} && #{service_loader} #{application} reload"
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
