## Reset KODI DIRECTORY

echo "delete profile HTPC"
sudo userdel -r htpc

## RUN INSTALL SH
echo "Calling install.sh"
source ./install.sh

echo "Setting default files inside .kodi for HTPC user"
mkdir /home/htpc/
mkdir /home/htpc/.kodi
mkdir /home/htpc/.kodi/addons
mkdir /home/htpc/.kodi/userdata
sudo cp -r /htpc/kodi/addons/plugin.program.digiwizard /home/htpc/.kodi/addons/
sudo cp -r /htpc/kodi/userdata/profiles /home/htpc/.kodi/
sudo reboot

