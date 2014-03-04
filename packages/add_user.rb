package :add_user do
  description "Adds applications user"

  user       = $config.user.name
  password   = $config.user.password
  user_home  = "/home/#{user}"
  user_shell = "/bin/bash"

  runner "useradd -m -d #{user_home} -s #{user_shell} -U #{user}" do
    post :install, "echo #{user}:#{password} | chpasswd"
    post :install, "mkdir -p #{user_home}/.ssh"
    post :install, "touch #{user_home}/.ssh/authorized_keys"
    post :install, "touch #{user_home}/.bash_history"
  end

  # Setup SSH credentials
  runner 'ssh-kegen -b 2048 -t rsa -f /tmp/sshkey -q -N ""'

  # Make sure ssh credentials have proper permissions
  runner "chmod 700 #{user_home}/.ssh"
  runner "chmod 600 #{user_home}/.ssh/*"

  # Add user to passwordless sudoers
  if $config.user.sudo
    runner "echo \"#{user} ALL=NOPASSWD: ALL\" >> /etc/sudoers"
  end

  # Install current user ssh key
  transfer File.expand_path("~/.ssh/id_rsa.pub"), "#{user_home}/.ssh/authorized_keys"

  # Force home directory ownership
  runner "chown -R #{user}:#{user} #{user_home}"

  verify do
    has_user user
    has_group user

    if $config.user.sudo
      file_contains "/etc/sudoers", "#{user} ALL=NOPASSWD"
    end

    has_file "#{user_home}/.ssh/id_rsa.pub"
    has_file "#{user_home}/.ssh/id_rsa"
    has_file "#{user_home}/.ssh/authorized_keys"
  end
end