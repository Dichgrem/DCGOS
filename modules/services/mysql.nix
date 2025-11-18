{ hostname, lib, pkgs, ... }:
with lib; let
  inherit (import ../../hosts/${hostname}/env.nix) Database-Use-Case;
in
{
  config = mkIf Database-Use-Case {
    services.mysql = {
      enable = true;
      package = pkgs.mysql84;
    };

    environment.systemPackages = [
      pkgs.dbeaver-bin
    ];
  };
}

