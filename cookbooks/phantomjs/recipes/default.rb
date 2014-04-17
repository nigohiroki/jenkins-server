remote_file "#{node['phantomjs']['file_name']}" do
  source "#{node['phantomjs']['remote_uri']}"
end

bash "" do
  user "root"
  cwd "/tmp"
  code <<-EOH
    tar -xvf phantomjs-1.9.7-linux-x86_64.tar.bz2  
  EOH
end
