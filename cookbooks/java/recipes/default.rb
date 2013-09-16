bash "java" do
  code <<-EOH
    yum install -y java-1.7.0-openjdk.x86_64
  EOH
end
