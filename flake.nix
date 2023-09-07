{
  description = "NixOS HTPC Developer Branch";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
#    git-htpc.url = "git+https://github.com/ChiropracticBender/nixos-htpc?ref=branch&rev=fdc8ef970de2b4634e1b3dca296e1ed918459a9e";
#    git-directory-htpc = "git+file:./htpc-tools/repo?shallow=1";
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
