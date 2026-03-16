{
  hostname,
  pkgs,
  ...
}: let
  inherit (import ../../hosts/${hostname}/env.nix) WM;
  wmSession =
    if WM == "niri"
    then "niri-session"
    else WM;
in {
  services.greetd = {
    enable = true;
    useTextGreeter = true;
    settings.default_session = {
      user = "greeter";
      command = "${pkgs.tuigreet}/bin/tuigreet -c ${wmSession} -t --user-menu";
    };
  };
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal";
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };
}
