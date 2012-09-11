include_recipe "unicorn"

template "#{node[:release_dir]}/config/database.yml" do
  mode 0640
  source "database.yml.erb"
end

if node[:app_env] == "development"
  directory "#{node[:release_dir]}/log" do
    mode 0750
  end

  execute "test log" do
    command "touch #{node[:release_dir]}/log/test.log"
    creates "#{node[:release_dir]}/log/test.log"
  end
else
  link "#{node[:release_dir]}/log" do
    to "#{node[:project_dir]}/#{node[:log_dir]}"
  end

  execute "service #{node[:app_name]}" do
    command "sudo ln -nfs /data/#{node[:app_name]}/current/libexec/#{node[:app_name]} /etc/init.d/#{node[:app_name]}"
    creates "/etc/init.d/#{node[:app_name]}"
  end
end

execute "app_env log" do
  command "touch #{node[:release_dir]}/log/#{node[:app_env]}.log"
  creates "#{node[:release_dir]}/log/#{node[:app_env]}.log"
end

