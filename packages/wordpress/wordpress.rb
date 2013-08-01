package :wordpress do
  description "Wordpress Nginx PHP VHost Setup"

  user = "apps"
  home = "/home/#{user}/www"

  transfer "files/php/index.php", "/tmp/index.php"

  runner "mkdir -p #{home}/current" do
    post :install, "mv /tmp/index.php #{home}/current/"
    post :install, "chown -R #{user}:#{user} /home/#{user}"
  end

  transfer "files/nginx/php_vhost.conf", "/tmp/vhost.conf" do
    post :install, "cat /tmp/vhost.conf > /etc/nginx/sites-enabled/default"
    post :install, "rm /tmp/vhost.conf"
    post :install, "/etc/init.d/nginx restart"
  end

  verify do
    has_directory "/home/apps/www/current"
    has_file "/home/apps/www/current/index.php"
    file_contains "/etc/nginx/sites-enabled/default", "/home/apps/www/current"
  end
end