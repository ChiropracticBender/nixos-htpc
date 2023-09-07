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
sudo cp -r ./tmp/* /htpc
echo "Deleting temp files"
sudo rm -r ./tmp
echo "Copying your hardware config to HTPC"
sudo cp -r /etc/nixos/hardware-configuration.nix /htpc/nixos
# NEEDS IF STATEMENT IS TRUE
echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC

while true; do
    read -p "Do you wish to change/set account passwords? " yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "SET DEVELOPER PASSWORD"
passwd developer
echo "SET HTPC ACCOUNT PASSWORD"
passwd kodi

