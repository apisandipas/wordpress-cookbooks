package :php5_extensions do
  description 'PHP5 Extensions'
  requires :php5

  ext_path = '/etc/php5/conf.d'

  apt 'php-pear'
  apt 'php5-gd', 'php5-xcache'
  apt 'php5-mysql', 'php5-pgsql', 'php5-mcrypt'
  apt 'php5-xdebug', 'php5-curl'

  runner 'prinf "yes\n" | pecl install memcache' do
    post :install, 'echo "extension=memcache.so" > /etc/php5/conf.d/memcache.ini'
  end

  verify do
    has_apt 'php-pear'
    has_apt 'php5-gd'
    has_apt 'php5-xcache'
    has_apt 'php5-mysql'
    has_apt 'php5-pgsql'
    has_apt 'php5-mcrypt'
    has_apt 'php5-xdebug'
    has_apt 'php5-curl'

    has_file "#{ext_path}/pdo_mysql.ini"
    has_file "#{ext_path}/pgsql.ini"
    has_file "#{ext_path}/xcache.ini"
    has_file "#{ext_path}/memcache.ini"
  end
end