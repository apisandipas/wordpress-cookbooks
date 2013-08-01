package :mysql_client do
  description "MySQL Client"

  apt "mysql-client", "libmysqlclient-dev"

  verify do
    has_apt "mysql-client"
    has_executable "mysql"
  end
end