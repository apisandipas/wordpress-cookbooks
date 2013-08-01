package :apt_sources do
  description "Setup custom repositories"

  apt "python-software-properties" do
    post :install, "add-apt-repository -y ppa:git-core/ppa"
    post :install, "add-apt-repository -y ppa:svn/ppa"
    post :install, "apt-get update -y"
  end
  
  verify do
    has_apt "python-software-properties"
  end
end