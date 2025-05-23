{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [

    # archive
    p7zip
    gnutar
    unzipNLS
    xz
    zip
    zstd

    # core
    greetd.tuigreet
    just
    v4l-utils # For OBS virtual cam support

    # editor use in tty
    micro

    # networking tool
    curl

    # misc
    expect
    file
    gcc
    ghc
    gnumake
    jq
    libvirt
    lm_sensors
    libnotify
    meson
    ninja
    pkg-config
    sarasa-gothic
    zenith
  ];

  programs = {
    dconf.enable = true;
    fuse.userAllowOther = true;
    git = {
      enable = true;
      package = pkgs.gitMinimal;
    };
    ssh.startAgent = true;
  };
}
