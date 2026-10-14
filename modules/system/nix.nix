{
  inputs,
  lib,
  ...
}:
with lib; {
  environment.etc."nix/inputs/nixpkgs".source = "${inputs.nixpkgs}";
  nix = {
    channel.enable = false;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    # package = pkgs.lix; # use lix instead of nix would cause clan-cli error
    registry.nixpkgs.flake = inputs.nixpkgs;
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
      connect-timeout = 5;
      keep-going = true;
      log-lines = 25;
      nix-path = mkForce ["nixpkgs=/etc/nix/inputs/nixpkgs"];
      substituters = [
        # "https://cache.garnix.io" # See https://github.com/daeuniverse/flake.nix
        "https://cache.nixos.org" # See https://nixos.wiki/wiki/Binary_Cache
        "https://nix-community.cachix.org" # See https://nix-community.org/cache/
        "https://cache.numtide.com" # See https://github.com/numtide/llm-agents.nix
      ];
      trusted-public-keys = [
        # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];
      warn-dirty = false;
    };
  };
  nixpkgs = {
    config.allowUnfree = false;

    # TODO: Remove once nixos-unstable contains upstream commit ac7b1aaed03d
    # ("typescript-language-server: fix pnpm hash", 2026-10-11).
    # nixpkgs rev 7fd4004d still ships a stale pnpmDeps hash for
    # typescript-language-server 6.0.2, so the build fails with a hash mismatch.
    overlays = [
      (_final: prev: {
        typescript-language-server = prev.typescript-language-server.overrideAttrs (old: {
          pnpmDeps = old.pnpmDeps.overrideAttrs (_: {
            outputHash = "sha256-xR/EF60lVBsITKgH7wCM2wHM46PFQevD51KfCENSUH4=";
          });
        });
      })
    ];
  };
}
