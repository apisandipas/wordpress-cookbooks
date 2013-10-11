package :ppa do
  apt "python-software-properties"

  verify do
    has_apt "python-software-properties"
    has_executable "add-apt-repository"
  end
end