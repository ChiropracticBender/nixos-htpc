## UPDATE SYSTEM

echo "Copying /etc/nixos to /htpc/nixos"
sudo cp -r /etc/nixos/* /htpc/nixos
echo "Checking for Updates"

curl -s https://api.github.com/repos/ChiropracticBender/nixos-htpc/latest \
| grep browser_download_url \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

#echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC

#test code change
