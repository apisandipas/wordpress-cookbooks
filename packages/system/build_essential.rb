package :build_essential do
  description "Build essentials"

  apt(
    "build-essential",
    "autoconf",
    "libcurl4-gnutls-dev",
    "zlib1g",
    "zlib1g-dev",
    "libxml2",
    "libxml2-dev",
    "libxslt-dev",
    "libreadline6-dev",
    "libyaml-dev",
    "bison"
  )
end