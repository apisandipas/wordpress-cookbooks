# NOTE: bsdmainutils should be moved into debootstrap process so its installed
# on all new VMs automatically. Otherwise apt will bitch that it could not
# find it and this might cause install failure.

package :system_tools do
  apt "bsdmainutils"
  apt "unzip"
  apt "curl"

  verify do
    has_executable "unzip"
    has_executable "curl"
  end
end