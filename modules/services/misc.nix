{ lib, pkgs, username, ... }:

{
  services = {
#    fgrim = {
#      enable = true;
#      interval = "weekly";
#    };
    gvfs.enable = true;
    power-profiles-daemon.enable = true;
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
  };

  services.aria2.enable = false;
  systemd.services.aria2 = {
    description = "Aria2 Download Manager (dich)";
    after = [ "network.target" ];
    wants = [ "network.target" ];
    wantedBy = [ "multi-user.target" ];

    serviceConfig = {
      Type = "simple";
      User = username;

      ExecStartPre = [
        "${pkgs.coreutils}/bin/mkdir -p /home/${username}/.config/aria2"
        "${pkgs.coreutils}/bin/touch /home/${username}/.config/aria2/aria2.session"
      ];

      ExecStart = "${pkgs.aria2}/bin/aria2c --conf-path=/home/${username}/.config/aria2/aria2.conf";

      Restart = "always";
      RestartSec = "5s";

      NoNewPrivileges = true;
      PrivateTmp = true;
    };
  };

  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}/Sync";
    configDir = "/home/${username}/.config/syncthing";
    guiAddress = "127.0.0.1:8384";
  };
}

