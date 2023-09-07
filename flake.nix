{
  description = "NixOS HTPC Developer Branch";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    version = builtins.substring 0 8 lastModifiedDate;
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
