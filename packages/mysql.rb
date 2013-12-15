package :mysql do
  apt "mysql-server"

  root_password = $config.mysql.root.password
  runner "mysqladmin -u root password #{root_password}"

  verify do
    has_apt "mysql-server"
    has_executable "mysqld"
    has_executable "mysqld_safe"
    runs_without_error "mysql -u root -p#{root_password} -e \"SHOW DATABASES;\""
  end
end