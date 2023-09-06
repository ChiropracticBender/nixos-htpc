{
  description = "NixOS HTPC Developer Branch";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
#    htpcrepo.url = "github:ChiropracticBender/nixos-htpc";
#    htpcrepo.flake = true;
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        allowUnfree = true;
      };
    };

  in 
  {
  
  nixosConfigurations = {
    NixOSHTPC = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };

      modules = [
      ./nixos/configuration.nix
      ];
    };
  };

  };
}
