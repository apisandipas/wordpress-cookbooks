package :apt_upgrade do
  runner "apt-get upgrade -y" do
    post :install, "touch /tmp/_apt_upgrade"
  end

  verify do
    has_file "/tmp/_apt_upgrade"
  end
end