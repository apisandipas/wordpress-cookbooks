package :subversion do
  runner "add-apt-repository -y ppa:svn/ppa" do
    post :install, "apt-get update -y"
  end

  apt "subversion"

  verify do
    has_executable "svn"
  end
end