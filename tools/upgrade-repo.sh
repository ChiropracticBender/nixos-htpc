echo "copying master system to /htpc and /dev-htpc"
sudo cp -r /etc/nixos/* /htpc/nixos
sudo cp -r /etc/nixos/* /dev-htpc/nixos

git add *
# change this to require developer input
git commit -m "System Generated from upgrade-repo.sh"

while true; do
    read -p "Do you wish to publish changes to Github? " yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

git push
