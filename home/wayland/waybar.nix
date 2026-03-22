_: {
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true;
      targets = ["niri-session.target"];
    };
  };
}
