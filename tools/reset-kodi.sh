## Reset KODI DIRECTORY

echo "delete profile kodi"
sudo userdel -r htpc

## RUN INSTALL SH
echo "Calling install.sh"
source ./install.sh

echo "Setting default files inside .kodi for HTPC user"
sudo su
sudo cp -r /htpc/kodi/addons/plugin.program.digiwizard /home/htpc/.kodi/addons/
sudo cp -r /htpc/kodi/userdata/profiles /home/htpc/.kodi/
sudo reboot

