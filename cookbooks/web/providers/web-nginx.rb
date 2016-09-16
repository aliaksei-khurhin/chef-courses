action :install do
  package 'nginx' do
  end
end

action :start do
  service 'nginx' do
    action :start
  end
end

action :stop do
  service 'nginx' do
    action :stop
  end
end

action :restart do
  service 'nginx' do
    action :restart
  end
end

action :reload do
  service 'nginx' do
    action :reload
  end
end

action :setup do
  file '/usr/share/nginx/html/index.html' do
    content '<html>This is NGINX provider test page.</html>'
    mode '0755'
    owner 'nginx'
    group 'nginx'
  end
end

