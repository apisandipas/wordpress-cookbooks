package :add_user do
  description 'Adds a applications user'

  user       = $config.user.name
  password   = $config.user.password
  user_home  = "/home/#{user}"
  user_shell = "/bin/bash"

  runner "useradd -m -d #{user_home} -s #{user_shell} -U #{user}" do
    post :install, "echo #{user}:#{password} | chpasswd"
    post :install, "mkdir -p #{user_home}/.ssh"
    post :install, "touch #{user_home}/.ssh/authorized_keys"
    post :install, "touch #{user_home}/.bash_history"
    post :install, "chmod 700 #{user_home}/.ssh"
    post :install, "chmod 600 #{user_home}/.ssh/*"
    post :install, "chown -R #{user}:#{user} #{user_home}"
  end

  if $config.user.sudo
    runner "echo \"#{user} ALL=NOPASSWD: ALL\" >> /etc/sudoers"
  end

  verify do
    has_user user
    has_group user

    if $config.user.sudo
      file_contains "/etc/sudoers", "#{user} ALL=NOPASSWD"
    end
  end
end