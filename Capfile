#!/usr/bin/env ruby

require 'alpha_omega/deploy'
load 'config/deploy'

# rtfm deploy
namespace :rtfm do
  task :update_code do
    run "cd #{deploy_release} && #{ruby_loader} bin/local-helper rake db:migrate"
    run "cd #{deploy_release} && #{ruby_loader} bin/local-helper bundle exec rake local_index"
  end

  task :restart do
  end
end

# hooks into alpha_omega deploy
after "deploy:update_code", "rtfm:update_code"
after "deploy:cook", "microwave:cook"
after "deploy:restart", "rtfm:restart"

# interesting hosts
Deploy self, __FILE__ do |admin, node| 
  { :deploy => { } }
end
