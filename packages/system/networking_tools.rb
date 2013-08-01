package :networking_tools do
  description "Networking unitilies"

  packages = [
    "lsof",
    "iptables",
    "jwhois",
    "whois",
    "curl",
    "wget",
    "rsync",
    "jnettop",
    "nmap",
    "traceroute",
    "ethtool",
    "iproute",
    "iputils-ping",
    "netcat-openbsd",
    "tcpdump",
    "elinks",
    "lynx",
    "bind9-host"
  ]

  packages.each do |name|
    apt(name)
  end

  verify do
    packages.each do |name|
      has_apt(name)
    end
  end
end

