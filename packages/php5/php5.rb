package :php5 do
  runner "add-apt-repository ppa:ondrej/php5-oldstable" do
    post :install, "apt-get update -y"
  end

  apt "php5-cli", "php5-common"#, "php5-suhosin"
  apt "php5-cgi", "php5-dev"

  transfer "files/php/php.ini", "/etc/php5/php.ini" do
    post :install, "rm /etc/php5/cgi/php.ini && ln -s /etc/php5/php.ini /etc/php5/cgi/php.ini"
    post :install, "rm /etc/php5/cli/php.ini && ln -s /etc/php5/php.ini /etc/php5/cli/php.ini"
  end

  verify do
    has_apt "php5-cli"
    has_apt "php5-common"
    #has_apt "php5-suhosin"
    has_apt "php5-cgi"
    has_apt "php5-dev"

    has_executable "php"
    has_executable "phpize"

    has_directory "/etc/php5"
    has_file "/etc/php5/php.ini"
    has_symlink "/etc/php5/cli/php.ini", "/etc/php5/php.ini"
    has_symlink "/etc/php5/cgi/php.ini", "/etc/php5/php.ini"
  end
end