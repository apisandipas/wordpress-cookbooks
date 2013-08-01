package :user_tools do
  description "Set of user tools to manage server"

  apt "nano"
  apt "inetutils-ftp"
  apt "inetutils-telnet"
  apt "inetutils-traceroute"

  verify do
    has_apt "nano"
    has_apt "inetutils-ftp"
    has_apt "inetutils-telnet"
    has_apt "inetutils-traceroute"
  end
end