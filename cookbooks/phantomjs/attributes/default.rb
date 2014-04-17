version = "1.9.7-linux-x86_64" 
default['phantomjs']['file_path']  = "/usr/local" 
default['phantomjs']['file_name']  = "#{default['phantomjs']['file_path']}/phantomjs-#{version}.tar.bz2" 
default['phantomjs']['remote_uri'] = "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-#{version}.tar.bz2" 
default['phantomjs']['libraries']  = ["freetype", "fontconfig"]
default['phantomjs']['path']       = "#{default['phantomjs']['file_path']}/phantomjs-#{version}/bin"
default['phantomjs']['bash_file']  = "/etc/profile.d/phantomjs.sh"
