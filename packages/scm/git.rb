package :git, :provides => :scm do
  description "Git"
  
  apt "git-core"

  verify do
    has_executable "git"
  end
end