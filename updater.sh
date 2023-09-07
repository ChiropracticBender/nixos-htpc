## UPDATE SYSTEM

echo "Checking for Updates"

curl -L \
  https://api.github.com/repos/chiropracticbender/nixos-htpc/releases/latest \
| grep zipball_url \
| grep -i -o "https://[^ ]*" \
| wget -qi -

# NEEDS IF STATEMENT IS TRUE
#echo "Applying Updates to HTPC"
#sudo nixos-rebuild switch --flake /htpc/#NixOSHTPC


