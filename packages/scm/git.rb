package :git do
  runner "add-apt-repository -y ppa:git-core/ppa" do
    post :install, "apt-get update -y"
  end

  apt "git"

  verify do
    has_apt "git"
    has_executable_with_version "git", "1.8", "--version"
  end
end