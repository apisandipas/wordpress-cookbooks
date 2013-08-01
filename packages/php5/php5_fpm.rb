package :php5_fpm do
  description "PHP-FPM application server"
  requires :php5

  transfer "files/php/www.conf", "/tmp/www.conf"

  apt "php5-fpm" do
    post :install, "rm /etc/php5/fpm/php.ini && ln -s /etc/php5/php.ini /etc/php5/fpm/php.ini"
    post :install, "cat /tmp/www.conf > /etc/php5/fpm/pool.d/www.conf"
    post :install, "rm /tmp/www.conf"
  end

  verify do
    has_apt "php5-fpm"
    has_directory "/etc/php5/fpm"
    has_symlink "/etc/php5/fpm/php.ini", "/etc/php5/php.ini"
  end
end