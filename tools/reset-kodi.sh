## Reset KODI DIRECTORY

echo "deleting kodi directory"
sudo rm -r /home/htpc/.kodi

## RUN INSTALL SH
echo" Calling install.sh
source ./install.sh

echo "Setting default files inside .kodi for HTPC user"
sudo cp -r /htpc/kodi /home/htpc/.kodi
sudo reboot

