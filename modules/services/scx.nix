{ lib, pkgs, username, ... }:

{
  services = {
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
  };
}

