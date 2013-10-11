package :locales do
  apt "locales"

  transfer "files/locales/environment", "/tmp/environment" do
    post :install, "cat /tmp/environment > /etc/environment"
    post :install, "rm /tmp/environment"
  end

  runner "apt-get install --reinstall locales" do
    post :install, "locale-gen --purge en_US en_US.UTF-8"
    post :install, "dpkg-reconfigure locales"
    post :install, "update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8"
    post :install, "export LANGUAGE=en_US.UTF-8"
    post :install, "export LC_ALL=en_US.UTF-8"
    post :install, "export LANG=en_US.UTF-8"
  end

  verify do
    has_apt "locales"
    has_file "/etc/environment"
    file_contains "/etc/environment", "en_US.UTF-8"
  end
end