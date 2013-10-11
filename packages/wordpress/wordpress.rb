package :wordpress do
  user = "apps"
  home = "/home/#{user}/www"

  transfer "files/php/index.php", "/tmp/index.php"

  runner "mkdir -p #{home}/current" do
    post :install, "mv /tmp/index.php #{home}/current/"
    post :install, "chown -R #{user}:#{user} /home/#{user}"
  end

  verify do
    has_directory "/home/apps/www/current"
    has_file "/home/apps/www/current/index.php"
  end
end