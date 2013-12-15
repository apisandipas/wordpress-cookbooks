package :clean_logs do
  # Remove all logs
  runner "echo > /var/log/bootstrap.log"
  runner "echo > /var/log/dpkg.log"
  runner "echo > /var/log/alternatives.log"
  runner "echo > /var/log/apt/history.log"
  runner "echo > /var/log/apt/term.log"

  # Remove aptitude cache
  runner "apt-get clean all -y"
end