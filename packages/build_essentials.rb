package :build_essentials do
  packages = [
    "build-essential",
    "zlib1g-dev",
    "libyaml-dev", 
    "libssl-dev",
    "libgdbm-dev",
    "libreadline-dev",
    "libncurses5-dev",
    "libffi-dev",
    "checkinstall",
    "libxml2-dev",
    "libxslt1-dev",
    "libcurl4-openssl-dev",
    "libicu-dev",
    "curl",
    "openssh-server"
  ]

  apt(packages)

  verify do
    packages.each { |name| has_apt(name) }
  end
end