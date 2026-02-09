{ lib, pkgs, username, ... }:

{
  services = {
    gvfs.enable = true;

    postgresql = {
      enable = true;
      package = pkgs.postgresql_17;

      enableTCPIP = true;

      authentication = pkgs.lib.mkOverride 10 ''
        local   all             all                                     trust
        host    all             all             127.0.0.1/32            trust
        host    all             all             ::1/128                 trust
      '';
    };
  };

  networking.firewall.allowedTCPPorts = [ 5432 ];
}
