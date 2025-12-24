{
  description = "🥶";

  inputs = {
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    lazyvim.inputs.nixpkgs.follows = "nixpkgs";
    lazyvim.url = "github:pfassina/lazyvim-nix";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    # chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    # daeuniverse.url = "github:daeuniverse/flake.nix";
    # disko.inputs.nixpkgs.follows = "nixpkgs";
    # disko.url = "github:nix-community/disko";
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
