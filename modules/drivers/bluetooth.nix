{
  hostname,
  lib,
  ...
}: let
  inherit (import ../../hosts/${hostname}/env.nix) Bluetooth;
in {
  hardware.bluetooth = lib.mkIf Bluetooth {
    enable = true;
    powerOnBoot = false;
  };
  services.blueman.enable = lib.mkIf Bluetooth true;
}
