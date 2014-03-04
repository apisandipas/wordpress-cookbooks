package :openssh_configs do
  transfer "files/openssh/ssh_config", "/etc/ssh/ssh_config"
  transfer "files/openssh/sshd_config", "/etc/ssh/sshd_config"

  verify do
    file_contains "/etc/ssh/sshd_config", "Doejo SSH config"
    file_contains "/etc/ssh/ssh_config", "Doejo SSH config"
  end
end