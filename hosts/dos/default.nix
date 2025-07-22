{ lib, pkgs, username, ... }:

{
  imports = [ ./hardware.nix ]
    ++ lib.filesystem.listFilesRecursive ../../modules;

  users.users."${username}" = {
    extraGroups              = [ "libvirtd" "networkmanager" "wheel" ];
    homeMode                 = "755";
    ignoreShellProgramCheck  = true;
    isNormalUser             = true;
    shell                    = pkgs.nushell;
  };

  # 不加载官方 aria2 模块
  services.aria2.enable = false;

  # 自定义 systemd 单元：aria2
  systemd.services.aria2 = {
    description = "Aria2 Download Manager (dich)";
    after       = [ "network.target" ];
    wants       = [ "network.target" ];
    wantedBy    = [ "multi-user.target" ];

    serviceConfig = {
      Type             = "simple";
      User             = username;

      ExecStartPre = [
        "${pkgs.coreutils}/bin/mkdir -p /home/${username}/.config/aria2"
        "${pkgs.coreutils}/bin/touch /home/${username}/.config/aria2/aria2.session"
      ];

      ExecStart        = "${pkgs.aria2}/bin/aria2c --conf-path=/home/${username}/.config/aria2/aria2.conf";

      Restart          = "always";
      RestartSec       = "5s";

      NoNewPrivileges  = true;
      PrivateTmp       = true;
    };
  };

  # 启用 Syncthing，为用户运行
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}/Sync";  # Syncthing 默认同步文件夹
    configDir = "/home/${username}/.config/syncthing";
    guiAddress = "127.0.0.1:8384";        # Web UI 地址
  };
}



