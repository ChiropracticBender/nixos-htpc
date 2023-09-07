## UPDATE SYSTEM

echo "Checking for Updates"

curl -s https://api.github.com/repos/ChiropracticBender/nixos-htpc/latest \
| grep browser_download_url \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

# Version key/value should be on his own line
PACKAGE_VERSION=$(cat flex.nix \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g')

echo $PACKAGE_VERSION

# NEEDS IF STATEMENT IS TRUE
#echo "Applying Updates to HTPC"
sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC


