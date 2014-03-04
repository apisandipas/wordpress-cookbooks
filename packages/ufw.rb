package :ufw do
  description "Ubuntu Firewall"

  apt "ufw"

  verify do
    has_apt "ufw"
    has_executable "ufw"
  end
end