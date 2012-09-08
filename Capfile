#!/usr/bin/env ruby

require 'alpha_omega/deploy'
load 'config/deploy'

# rtfm deploy
namespace :rtfm do
  task :update_code do
  end

  task :restart do
  end
end

# hooks into alpha_omega deploy
after "deploy:update_code", "rtfm:update_code"
after "deploy:restart", "rtfm:restart"

# interesting hosts
Deploy self, __FILE__ do |admin, node| 
  { :deploy => { } }
end
