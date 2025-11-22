{ hostname, lib, pkgs, ... }:
with lib; let
  inherit (import ../../hosts/${hostname}/env.nix) Power-control;
in
{
  services.power-profiles-daemon.enable = (Power-control == "PPD");

  services.tlp = lib.mkIf (Power-control == "TLP") {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "powersave";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 85;
    };
  };
}
