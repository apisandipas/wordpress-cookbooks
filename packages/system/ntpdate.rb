package :ntpdate do
  description "NTP date syncronization"

  apt "ntpdate"

  runner "ntpdate ntp.ubuntu.com pool.ntp.org" do
    post :install, 'echo "ntpdate ntp.ubuntu.com pool.ntp.org" > /etc/cron.daily/ntpdate'
    post :install, 'chmod +x /etc/cron.daily/ntpdate'
  end

  verify do
    has_apt "ntpdate"
    has_file "/etc/cron.daily/ntpdate"
  end
end