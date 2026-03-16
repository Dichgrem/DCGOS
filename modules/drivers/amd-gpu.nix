{
  hostname,
  lib,
  pkgs,
  ...
}: let
  inherit (import ../../hosts/${hostname}/env.nix) GPU-AMD;
in {
  systemd.tmpfiles.rules = lib.mkIf GPU-AMD [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
  services.xserver.videoDrivers = lib.mkIf GPU-AMD ["amdgpu"];
}
