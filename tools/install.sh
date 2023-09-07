## UPDATE SYSTEM

#echo "Cleaning HTPC dir"
#sudo rm -r /htpc
echo "Entering NIX SHELL GIT"
#nix-shell -p git
echo "Making/Checking htpc dir"
sudo mkdir /htpc
echo "Cloning MASTER Repo"
sudo git clone https://github.com/ChiropracticBender/nixos-htpc tmp
echo "Moving Files from downloaded repo to HTPC"
sudo cp -r tmp/* /htpc
echo "Deleting temp files"
sudo rm -r tmp
echo "Copying your hardware config to HTPC"
sudo cp -r /etc/nixos/hardware-configuration.nix /htpc/nixos
# NEEDS IF STATEMENT IS TRUE
echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC

