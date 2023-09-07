## UPDATE SYSTEM

echo "Entering NIX SHELL GIT"
#nix-shell -p git
echo "Cloning MASTER Repo"
git clone git@github.com:ChiropracticBender/nixos-htpc.git temp
echo "Making/Checking htpc dir"
mkdir /htpc
echo "Moving Files from downloaded repo to HTPC"
cp -r ./temp/nixos-htlp/* /htpc
echo "Deleting temp files"
rm -r /temp/nixos-htpc
# NEEDS IF STATEMENT IS TRUE
echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC


