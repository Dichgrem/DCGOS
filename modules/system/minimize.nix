{lib, ...}:
with lib; {
  # Minimize boot
  boot = {
    bcache.enable = mkForce false;
    binfmt.addEmulatedSystemsToNixSandbox = mkForce false;
  };

  # Disable unnecessary documentation
  documentation.enable = mkForce false;

  # Minimize environment
  environment = {
    defaultPackages = mkForce [];
  };

  # Disable unnecessary programs
  programs = {
    bash = {
      completion.enable = mkForce false;
      enableLsColors = mkForce false;
    };
    command-not-found.enable = mkForce false;
  };

  # Minimize services
  services = {
    gnome.gnome-keyring.enable = mkForce false;
    journald.settings.Journal = {
      Storage = "volatile";
      Compress = true;
      SystemMaxUse = "50M";
      RuntimeMaxUse = "10M";
      MaxFileSec = "1day";
      MaxRetentionSec = "1month";
      RateLimitInterval = "30s";
      RateLimitBurst = 1000;
    };
    resolved.enable = mkForce false;
    timesyncd.enable = mkForce false;
  };

  # Minimize systemd services
  systemd = {
    enableEmergencyMode = mkForce false;
    network.wait-online.enable = mkForce false;
    services = {
      mount-pstore.enable = mkForce false;
      NetworkManager-wait-online.enable = mkForce false;
      systemd-bsod.enable = mkForce false;
      systemd-importd.enable = mkForce false;
      systemd-journal-flush.enable = mkForce false;
      systemd-pstore.enable = mkForce false;
    };
  };

  # Disable xdg autostart
  xdg = {
    autostart.enable = mkForce false;
  };
}
