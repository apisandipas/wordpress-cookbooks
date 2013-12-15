$LOAD_PATH << "."

require "yaml"
require "hashr"

$config = Hashr.new(YAML.load_file("./config.yml"))
Dir["./packages/**/*.rb"].each { |f| require(f) } 

policy :build, :roles => :app do
  $config.packages.each { |name| requires(name) }
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