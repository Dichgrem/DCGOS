{pkgs, ...}: {
  home.packages = with pkgs; [awww];

  systemd.user.services.awww-daemon = {
    Unit = {
      Description = "awww wallpaper daemon";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.awww}/bin/awww-daemon";
      Restart = "on-failure";
      Slice = "session.slice";
    };
    Install = {
      WantedBy = ["niri-session.target"];
    };
  };
}
