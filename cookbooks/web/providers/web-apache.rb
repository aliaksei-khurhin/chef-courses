action :install do
  package 'httpd' do
  end
end

action :start do
  service 'httpd' do
  action :start
  end
end

action :stop do
  service 'httpd' do
  action :stop
  end
end

action :restart do
  service 'httpd' do
  action :restart
  end
end

action :reload do
  service 'httpd' do
    action :reload
  end
end

action :setup do
  file '/var/www/html/index.html' do
    content '<html>This is an Apache provider test page.</html>'
    mode '0755'
    owner 'apache'
    group 'apache'
  end
end
