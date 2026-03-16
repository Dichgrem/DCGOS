{
  pkgs,
  username,
  ...
}: let
  home = "/home/${username}";
  configDir = "${home}/.config/aria2";
in {
  systemd.services.aria2 = {
    description = "Aria2 Download Manager";
    wantedBy = ["multi-user.target"];
    after = ["network.target"];
    serviceConfig = {
      Type = "simple";
      User = username;
      ExecStartPre = "${pkgs.coreutils}/bin/mkdir -p ${configDir}";
      ExecStart = "${pkgs.aria2}/bin/aria2c --conf-path=${configDir}/aria2.conf --save-session=${configDir}/aria2.session";
      Restart = "always";
      RestartSec = "5s";
      NoNewPrivileges = true;
      PrivateTmp = true;
    };
  };
}
