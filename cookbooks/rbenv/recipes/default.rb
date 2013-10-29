git "/usr/local/rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :sync
end

group "rbenv" do
  action :create
end

%w{/usr/local/rbenv/shims /usr/local/rbenv/versions}.each do |dir|
  directory dir do
    group "rbenv"
    mode "775"
    action :create
  end
end

git "/usr/local/ruby-build" do
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :sync
end

bash "install_ruby_build" do
  cwd "/usr/local/ruby-build"
  code <<-EOH
    ./install.sh
  EOH
end

template "rbenv.sh" do
  path "/etc/profile.d/rbenv.sh"
  owner "root"
  group "root"
  mode "0644"
  source "rbenv.sh.erb"
end

%w{make gcc zlib-devel openssl-devel readline-devel ncurses-devel gdbm-devel db4-devel libffi-devel tk-devel}.each do |pkg|
  yum_package pkg do
    action :install
  end
end

=begin
execute "rbenv install #{node['ruby']['versions']}" do
  command "source /etc/profile.d/rbenv.sh; rbenv install #{node['ruby']['versions']}"
  action :run
  not_if { ::File.exists?("/usr/local/rbenv/versions/#{node['ruby']['versions']}")}
end

execute "rbenv global #{node['ruby']['versions']}" do
  command "source /etc/profile.d/rbenv.sh; rbenv global #{node['ruby']['versions']}"
  action :run
end

execute "rbenv rehash" do
  command "source /etc/profile.d/rbenv.sh; rbenv rehash"
  action :run
end
=end
