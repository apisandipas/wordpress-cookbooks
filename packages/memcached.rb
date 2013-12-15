package :memcached do
  description "Memcached storage server"

  apt "memcached" do
    post :install, "/etc/init.d/memcached stop"
  end

  verify do
    has_executable "memcached"
  end
end