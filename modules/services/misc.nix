{ lib, pkgs, username, ... }:

{
  services = {
    gvfs.enable = true;
  };
}
