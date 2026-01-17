{ lib, pkgs, username, ... }:

{
  services = {
    gvfs.enable = true;
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
  };
}

