package :wordpress_vhost do
  transfer "files/nginx/php_vhost.conf", "/tmp/vhost.conf" do
    post :install, "cat /tmp/vhost.conf > /etc/nginx/sites-enabled/default"
    post :install, "rm /tmp/vhost.conf"
    post :install, "/etc/init.d/nginx reload"
  end

  verify do
    file_contains "/etc/nginx/sites-enabled/default", "/home/apps/www/current"
  end
end