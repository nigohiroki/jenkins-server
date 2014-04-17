bash "install_nginx" do 
  code <<-EOH
    rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
  EOH
  not_if "rpm -q nginx"
end

package "nginx" do
  action :install
end

service "nginx" do
  action [:enable, :start]
end
