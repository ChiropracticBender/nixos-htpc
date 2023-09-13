## UPDATE SYSTEM
version="0.1"


#echo "Cleaning HTPC dir"
#sudo rm -r /htpc
#echo "Entering NIX SHELL GIT"
#nix-shell -p git

echo  "Adding home manger channel"
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
sudo nix-channel --update

echo  "Making/Checking htpc dir"
sudo mkdir /htpc
sudo mkdir /htpc-tools

echo "Cloning MASTER Repo"
sudo git clone https://github.com/ChiropracticBender/nixos-htpc tmp

echo "Moving Files from downloaded repo to HTPC"
sudo cp -r tmp/* /htpc

echo "Copying installer tool to HTPC-Tools"
sudo cp -r tmp/tools/install.sh /htpc-tools/
sudo cp -r tmp/tools/links.sh /htpc-tools/
sudo cp -r tmp/reset-kodi.sh /htpc-tools
sudo cd /htpc-toosl
sudo chmod +x install.sh
sudo chmod +x links.sh
sudo chmod +x reset-kodi.sh

echo "Deleting temp files"
sudo rm -r tmp

echo "Copying your hardware config to HTPC"
sudo cp -r /etc/nixos/hardware-configuration.nix /htpc/nixos

# NEEDS IF STATEMENT IS TRUE
echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC --show-trace --impure

