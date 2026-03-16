{pkgs, ...}: {
  home.packages = with pkgs; [
    lxqt.lxqt-policykit
  ];
  systemd.user.services.lxqt-policykit-agent = {
    Unit = {
      Description = "PolicyKit LXQt Authentication Agent";
      PartOf = ["graphical-session.target"];
      After = ["graphical-session.target"];
    };
    Service = {
      ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
      Restart = "on-failure";
      Slice = "session.slice";
      Environment = "QT_QPA_PLATFORM=wayland";
    };
    Install = {
      WantedBy = ["niri-session.target"];
    };
  };
}
