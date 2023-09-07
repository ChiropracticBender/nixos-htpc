## UPDATE SYSTEM

echo "Entering NIX SHELL GIT"
#nix-shell -p git
echo "Cloning MASTER Repo"
sudo git clone https://github.com/ChiropracticBender/nixos-htpc temp
echo "Making/Checking htpc dir"
sudo mkdir /htpc
echo "Moving Files from downloaded repo to HTPC"
sudo cp -r ./temp/* /htpc
echo "Deleting temp files"
sudo rm -r ./temp
# NEEDS IF STATEMENT IS TRUE
echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC


