package :ufw_rules do
  runner "ufw disable"
  runner "printf \"y\n\" | ufw reset"
  runner "ufw logging off"
  runner "ufw default deny"
  runner "ufw default allow outgoing"

  if $config.firewall
    $config.firewall.open_ports.each do |port|
      runner "ufw allow #{port}"
    end
  end

  runner "printf \"y\n\" | ufw enable"

  verify do
    runs_without_error "ufw status"

    if $config.firewall
      $config.firewall.open_ports.each do |port|
        runs_without_error "ufw status | grep '#{port}'"
      end
    end
  end
end