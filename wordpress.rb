$LOAD_PATH << '.'
require 'packages/index'

policy :wordpress, :roles => :app do
  requires :apt_sources
  requires :system_tools
  requires :locales
  requires :ntpdate
  requires :build_essential
  requires :git
  requires :subversion
  requires :imagemagick
  requires :mysql_client
  requires :add_user
  requires :setup_user
  requires :nginx
  requires :php5
  requires :php5_extensions
  requires :php5_fpm
  requires :wordpress
  requires :clean_logs
end

puts ENV.keys

deployment do
  delivery :ssh do
    user ENV['TARGET_USER']
    password ENV['TARGET_PASSWORD']
    role :app, ENV['TARGET_HOST']
  end
end