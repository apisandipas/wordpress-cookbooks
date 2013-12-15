package :nginx do
  runner "add-apt-repository ppa:nginx/stable" do
    post :install, "apt-get update -y"
  end

  transfer "files/nginx/nginx.conf", "/tmp/nginx.conf"

  apt "nginx-full" do
    post :install, "cat /tmp/nginx.conf > /etc/nginx/nginx.conf"
    post :install, "rm /tmp/nginx.conf"
    post :install, "/etc/init.d/nginx restart"
  end

  verify do
    has_directory "/etc/nginx"
    has_file "/usr/sbin/nginx"
  end
end