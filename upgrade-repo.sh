echo "copying master system to /htpc and /dev-htpc"
sudo cp -r /etc/nixos/* /htpc/nixos
sudo cp -r /etc/nixos/* /dev-htpc/nixos

git add *
# change this to require developer input
git commit -m "System Generated from upgrade-repo.sh"
git push
