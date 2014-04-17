remote_file "#{node['phantomjs']['file_name']}" do
  source "#{node['phantomjs']['remote_uri']}"
end

bash "install_phantomjs" do
  user "root"
  cwd "#{node['phantomjs']['file_path']}"
  code <<-EOH
    tar -xvf "#{node['phantomjs']['file_name']}"
  EOH
end

node['phantomjs']['libraries'].each do |pkg|
  package pkg do 
    action :install
  end
end

template "phantomjs.sh" do
  path  "#{node['phantomjs']['bash_file']}"
  owner "root"
  group "root"
  mode "0644"
  source "phantomjs.sh.erb"
end

bash "symbolic link" do
  user "root"
  code <<-EOH
    ln -s #{node['phantomjs']['path']}/phantomjs /usr/bin/phantomjs
  EOH
  not_if { File.exists?("/usr/bin/phantomjs") }
end
