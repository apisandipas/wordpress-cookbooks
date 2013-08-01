package :nginx do
  description "Nginx web server"

  transfer "files/nginx/nginx.conf", "/tmp/nginx.conf"

  apt "nginx-full" do
    post :install, "cat /tmp/nginx.conf > /etc/nginx/nginx.conf"
    post :install, "rm /tmp/nginx.conf"
    post :install, "/etc/init.d/nginx start"
  end

  verify do
    has_directory "/etc/nginx"
    has_executable "nginx"
  end
end