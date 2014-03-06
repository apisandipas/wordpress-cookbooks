$LOAD_PATH << "."

require "yaml"
require "hashr"

$config = Hashr.new(YAML.load_file("./config.yml"))
Dir["./packages/**/*.rb"].each { |f| require(f) } 

policy :build, :roles => :app do
  requires :apt_update
  requires :apt_upgrade
  requires :system_tools
  requires :ppa
  requires :sudo
  requires :locales
  requires :ufw
  requires :ufw_rules
  requires :openssh_configs
  requires :ntpdate
  requires :build_essentials
  requires :git
  requires :subversion
  requires :imagemagick
  requires :mysql
  requires :mysql_client
  requires :mysql_setup
  requires :add_user
  requires :setup_user
  requires :nginx
  requires :php5
  requires :php5_extensions
  requires :php5_fpm
  requires :wordpress
  requires :wordpress_vhost
  requires :clean_logs
end

deployment do
  delivery :capistrano do
    set  :user,     $config.target.user
    set  :password, $config.target.password
    set  :port,     $config.target.port
    role :app,      $config.target.host
  end

  source do
    prefix   "/usr/local"
    archives "/usr/local/sources"
    builds   "/usr/local/build"
  end
end