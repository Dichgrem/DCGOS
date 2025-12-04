{ hostname, lib, pkgs, ... }:
with lib;
let
  inherit (import ../../hosts/${hostname}/env.nix) SingBox;
in
{
  disabledModules = [ "services/networking/sing-box.nix" ];

  config = mkIf SingBox {

    environment.systemPackages = [ pkgs.sing-box ];

    systemd.tmpfiles.rules = [
      "d /etc/sing-box 0755 root root -"
    ];

    systemd.services.sing-box = {
      description = "sing-box service (custom)";
      after = [ "network.target" ];
      wantedBy = [ ];

      script = ''
        exec ${pkgs.sing-box}/bin/sing-box -D "$STATE_DIRECTORY" run -c /etc/sing-box/config.json
      '';

      serviceConfig = {
        DynamicUser = true;
        CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_DAC_OVERRIDE";
        AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE CAP_DAC_OVERRIDE";

        NoNewPrivileges = true;
        StateDirectory = "sing-box";
        StateDirectoryMode = "0700";
        Restart = "always";
        RestartSec = 5;
      };
    };
  };
}
