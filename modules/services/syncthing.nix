{ lib, pkgs, username, ... }:

{
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}/Sync";
    configDir = "/home/${username}/.config/syncthing";
    guiAddress = "127.0.0.1:8384";
  };
}