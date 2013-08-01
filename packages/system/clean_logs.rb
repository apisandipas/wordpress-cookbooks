package :clean_logs do
  description "Clean logs and other things"

  runner "echo > /var/log/bootstrap.log"
  runner "echo > /var/log/dpkg.log"
  runner "echo > /var/log/alternatives.log"
  runner "echo > /var/log/apt/history.log"
  runner "echo > /var/log/apt/term.log"
end