## Reset KODI DIRECTORY

echo "deleting kodi directory"
sudo rm -r /home/kodi/.kodi
echo "Setting default files inside .kodi for HTPC user"
sudo cp -r /htpc/kodi /home/htpc/.kodi

