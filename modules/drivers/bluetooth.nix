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
  services.udev.extraRules = lib.mkIf Bluetooth ''
    ACTION=="add", SUBSYSTEM=="rfkill", ATTR{type}=="bluetooth", ATTR{soft}="1"
  '';
}
