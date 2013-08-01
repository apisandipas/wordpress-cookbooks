package :subversion, :provides => :scm do
  description "Subversion"
  
  apt "subversion"

  verify do
    has_executable "svn"
  end
end