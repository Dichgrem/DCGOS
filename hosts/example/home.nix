{ hostname, lib, username, ... }:
with lib;
let
  inherit (import ../../hosts/${hostname}/env.nix) QEMU-VM-Use-Case;
in
{
  imports = lib.filesystem.listFilesRecursive ../../home;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home = {
    file = {
      ".config" = {
        force = true;
        recursive = true;
        source = ../../dotfiles/.config;
      };
      ".local" = {
        force = true;
        recursive = true;
        source = ../../dotfiles/.local;
      };
    };
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
    username = "${username}";
  };

  programs.home-manager.enable = true;
}
