package :sudo do
  apt "sudo"

  verify do
    has_apt "sudo"
  end
end