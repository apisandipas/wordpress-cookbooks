package :add_user do
  description 'Adds a applications user'

  user       = "apps"
  password   = "apps"
  user_home  = "/home/#{user}"
  user_shell = "/bin/bash"

  runner "useradd -m -d #{user_home} -s #{user_shell} -U #{user}" do
    post :install, "echo #{user}:#{password} | chpasswd"
    post :install, "mkdir -p #{user_home}/.ssh"
    post :install, "touch #{user_home}/.ssh/authorized_keys"
    post :install, "touch #{user_home}/.bash_history"
    post :install, "chmod 700 #{user_home}/.ssh"
    post :install, "chmod 600 #{user_home}/.ssh/*"
    post :install, 'echo "apps ALL=NOPASSWD: ALL" >> /etc/sudoers'
  end

  transfer "files/add_user/rvmrc",  "#{user_home}/.rvmrc"
  transfer "files/add_user/gemrc",  "#{user_home}/.gemrc"

  runner "chown -R #{user}:#{user} #{user_home}"

  verify do
    has_user user
    has_group user

    has_file "#{user_home}/.rvmrc"
    has_file "#{user_home}/.gemrc"

    file_contains "/etc/sudoers", "#{user} ALL=NOPASSWD"
  end
end