## Reset KODI DIRECTORY

echo "delete profile kodi"
sudo userdel -r htpc

## RUN INSTALL SH
echo "Calling install.sh"
source ./install.sh

echo "Setting default files inside .kodi for HTPC user"
sudo cp -r /htpc/kodi/addons/plugin.program.digiwizard /home/htpc/.kodi/addons/
sudo cp -r /htpc/kodi/userdata/addon_data/plugin.program.digiwizard /home/htpc/.kodi/userdata/
sudo reboot

