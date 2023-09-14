## Reset KODI DIRECTORY

echo "delete profile HTPC userdel"
sudo userdel -r htpc
echo "Deleting nix GCRoots HTPC"
rm -r /nix/var/nix/gcroots/per-user/htpc
echo "Deleting Nix Profile HTPC"
rm -r /nix/var/nix/profiles/per-user/htpc
echo "Nix Garbage Collection..."
sudo nix-collect-garbage

## RUN INSTALL SH
echo "Calling install.sh"
source ./install.sh

echo "Setting default files inside .kodi for HTPC user"
sudo su
mkdir /home/htpc/
mkdir /home/htpc/.kodi
mkdir /home/htpc/.kodi/addons
mkdir /home/htpc/.kodi/userdata
sudo cp -r /htpc/kodi/addons/plugin.program.digiwizard /home/htpc/.kodi/addons/
sudo cp -r /htpc/kodi/userdata/profiles.xml /home/htpc/.kodi/


