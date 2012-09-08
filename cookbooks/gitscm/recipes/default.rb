include_recipe "unicorn"

link "#{node[:release_dir]}/log" do
  to "#{node[:project_dir]}/#{node[:log_dir]}"
end

execute "service #{node[:app_name]}" do
  command "sudo ln -nfs /data/#{node[:app_name]}/current/libexec/#{node[:app_name]} /etc/init.d/#{node[:app_name]}"
  creates "/etc/init.d/#{node[:app_name]}"
end
