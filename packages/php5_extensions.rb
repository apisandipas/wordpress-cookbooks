package :php5_extensions do
  requires :php5

  packages = [
    "php-pear",
    "php5-gd",
    "php5-xcache",
    "php5-mysql",
    "php5-pgsql",
    "php5-mcrypt",
    "php5-xdebug", 
    "php5-curl"
  ]

  apt(packages)

  ext_path = "/etc/php5/mods-available"

  runner 'printf "yes\n" | pecl install memcache' do
    post :install, "echo \"extension=memcache.so\" > #{ext_path}/memcache.ini"
    post :install, "ln -s #{ext_path}/memcache.ini /etc/php5/conf.d/20-memcache.ini"
  end

  verify do
    packages.each { |name| has_apt(name) }

    has_file "#{ext_path}/pdo_mysql.ini"
    has_file "#{ext_path}/pgsql.ini"
    has_file "#{ext_path}/xcache.ini"
    has_file "#{ext_path}/memcache.ini"
  end
end