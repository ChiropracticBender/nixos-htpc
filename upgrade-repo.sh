echo "copying master system to /htpc and /dev-htpc"
sudo cp -r /etc/nixos/* /htpc/nixos
sudo cp -r /etc/nixos/* /dev-htpc/nixos

git add *
git commit -m "System Generated from upgrade-repo.sh"
git push
