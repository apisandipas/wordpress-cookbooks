package :setup_user do
  runner "mkdir -p /home/apps/www" do
    post :install, "chown -R apps:apps /home/apps"
  end

  verify do
    has_directory '/home/apps'
    has_directory '/home/apps/www'
  end
end