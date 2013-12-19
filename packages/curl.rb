package :curl do
  apt "curl"

  verify do
    has_apt "curl"
    has_executable "curl"
  end
end