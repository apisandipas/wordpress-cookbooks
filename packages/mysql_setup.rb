package :mysql_setup do
  requires :mysql

  @root_password = $config.mysql.root.password
  @user_name     = $config.mysql.user.name
  @user_password = $config.mysql.user.password
  @database      = $config.mysql.database.name

  file "/tmp/mysql_setup", contents: render("mysql_setup.erb") do
    post :install, "mysql -u root -p#{$config.mysql.root.password} < /tmp/mysql_setup"
    post :install, "rm /tmp/mysql_setup"
  end

  verify do
    runs_without_error "mysql -u #{$config.mysql.user.name} -p#{$config.mysql.user.password} -e \"SHOW DATABASES;\""
    runs_without_error "mysql -u #{$config.mysql.user.name} -p#{$config.mysql.user.password} -e \"USE #{$config.mysql.database.name};\""
  end
end