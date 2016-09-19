# nginx port definition
default['nginx']['port'] = 80

# defining ports where proxied resources are working
default['tomcat']['port'] = 8080
default['jenkins']['port'] = 8081

# setting temporary directory
default['nginx']['tmp_folder'] = '/tmp'