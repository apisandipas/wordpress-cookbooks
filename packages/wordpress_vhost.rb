package :wordpress_vhost do
  sites_path = "/etc/nginx/sites-enabled"

  transfer "files/nginx/wordpress.conf", "#{sites_path}/wordpress.conf" do
    post :install, "rm #{sites_path}/default"
    post :install, "/etc/init.d/nginx reload"
  end

  verify do
    file_exists "#{sites_path}/wordpress.conf"
    file_contains "#{sites_path}/wordpress.conf", "/home/apps/www/current"
  end
end