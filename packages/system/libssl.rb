package :libssl do
  description "Development package for OpenSSL"

  apt "libssl1.0.0", "libssl-dev"

  verify do
    has_apt "libssl1.0.0"
    has_apt "libssl-dev"
  end
end