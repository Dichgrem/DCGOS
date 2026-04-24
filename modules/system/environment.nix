{
  hostname,
  pkgs,
  inputs,
  ...
}: let
  inherit (import ../../hosts/${hostname}/env.nix) ScaleLevel;
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in {
  environment = {
    variables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";

      _JAVA_AWT_WM_NONREPARENTING = 1;
      AWT_TOOLKIT = "MToolkit";
      CLUTTER_BACKEND = "wayland";
      ELECTRON_OZONE_PLATFORM_HINT = "wayland";
      GDK_BACKEND = "wayland";
      GDK_SCALE = "${ScaleLevel}";
      GTK_USE_PORTAL = 1;
      MOZ_ENABLE_WAYLAND = 1;
      NIXOS_OZONE_WL = 1;
      QT_AUTO_SCREEN_SCALE_FACTOR = 1;
      QT_QPA_PLATFORM = "wayland";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = 1;
      SDL_HINT_VIDEODRIVER = "wayland";
      XDG_SESSION_TYPE = "wayland";
      SDL_VIDEODRIVER = "wayland";

      QT_IM_MODULE = "fcitx";
      SDL_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };

    systemPackages = with pkgs; [
      # Archive
      gnutar
      p7zip
      unzipNLS
      xz
      zip
      zstd

      # Greeter with ddm
      tuigreet

      # System
      wlr-randr
      libnotify
      libvirt
      lm_sensors
      usbutils
      libsecret

      # For OBS virtual cam support
      v4l-utils

      # Networking tool
      curl
      wget
      aria2
      yt-dlp
      syncthing
      iw
      lsof
      openssl
      iperf3
      nexttrace
      rs-tftpd

      # Android
      xxd
      file
      tree
      binwalk
      qtscrcpy
      android-tools
      payload-dumper-go

      # Embedded
      scons
      openocd
      stlink
      stlink-tool
      gcc-arm-embedded
      tio

      # Nix-tools
      devenv
      nix-update

      # Blog
      zola
      pagefind

      # Misc
      nano
      age
      sops
      smartmontools

      # Languages
      go
      zig
      lua
      dart
      kotlin
      jdk17
      jdk21
      python312

      # Toolchains
      nodejs_24
      bun
      maven
      cargo

      # Compilers
      gcc
      clang
      rustc

      # Build Systems
      cmake
      gnumake

      # LSP
      nixd
      pyright
      lua-language-server
      rust-analyzer
      jdt-language-server
      bash-language-server
      typescript-language-server
      kotlin-language-server

      # Formatters
      jq
      taplo
      yamlfmt
      shfmt
      clang-tools
      ruff
      stylua
      biome
      gofumpt
      rustfmt
      nixfmt
      alejandra
      ktlint
      google-java-format

      # Highlight
      tree-sitter

      # Linters
      rumdl
      clippy
      deadnix

      # Test
      yaak

      # Debug
      gdb

      # Agent
      # llm-agents.codex
      llm-agents.opencode
    ];
  };

  programs = {
    dconf.enable = true;
    fuse.userAllowOther = true;
    ssh.startAgent = true;
  };
}
