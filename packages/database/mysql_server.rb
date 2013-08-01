package :mysql do
  description "MySQL Server 5.5"

  apt "mysql-server" do
    post :install, "/etc/init.d/mysql restart"
  end

  verify do
    has_apt "mysql-server"
    has_executable "mysqld"
    has_executable "mysqld_safe"
  end
end