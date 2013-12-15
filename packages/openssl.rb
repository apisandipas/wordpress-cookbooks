package :openssl do
  apt "openssl"

  verify do
    has_apt "openssl"
  end
end