{
  description = "🥶";

  inputs = {
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # daeuniverse.url = "github:daeuniverse/flake.nix";
    # disko.inputs.nixpkgs.follows = "nixpkgs";
    # disko.url = "github:nix-community/disko";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixvim.inputs.nixpkgs.follows = "nixpkgs";
    # nixvim.url = "github:nix-community/nixvim";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
  };

  outputs = inputs: let
    hostname = "dos";
    username = "dich";
  in {
    nixosConfigurations = {
      "${hostname}" = inputs.nixpkgs.lib.nixosSystem {
        modules = [./hosts];
        specialArgs = {inherit hostname inputs username;};
      };
    };
  };
}
