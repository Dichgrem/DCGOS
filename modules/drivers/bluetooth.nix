{
  hostname,
  lib,
  ...
}: let
  inherit (import ../../hosts/${hostname}/env.nix) Bluetooth;
in
  with lib; {
    config = mkIf Bluetooth {
      hardware.bluetooth = {
        enable = lib.mkDefault true;
        powerOnBoot = lib.mkDefault false;
      };
      services.blueman.enable = lib.mkDefault true;
    };
  }
