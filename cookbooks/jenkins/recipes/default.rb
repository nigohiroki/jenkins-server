bash "wget latest" do
  code <<-EOH
    wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
  EOH
end

bash "rpm key" do
  code <<-EOH
    rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
  EOH
end

bash "jenkins install" do
  code <<-EOH
    yum install -y jenkins
  EOH
end

bash "start" do 
  code <<-EOH
    /etc/init.d/jenkins start
  EOH
end
