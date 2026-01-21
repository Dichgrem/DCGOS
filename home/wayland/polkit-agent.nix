{pkgs, ...}: {
  home.packages = with pkgs; [
    polkit_gnome
  ];

  systemd.user.services.polkit-gnome-authentication-agent = {
    Unit = {
      Description = "PolicyKit GNOME Authentication Agent";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      Slice = "session.slice";
    };
    Install = {
      WantedBy = ["graphical-session.target"];
    };
  };
}
