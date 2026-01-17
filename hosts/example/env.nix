{
  # -------------------- Hardware --------------------
  # See: https://github.com/blueman-project/blueman
  Bluetooth = false;

  # See: https://nixos.wiki/wiki/AMD_GPU
  GPU-AMD = false;

  # See: https://nixos.wiki/wiki/Nvidia
  GPU-Nvidia = false;

  # See: https://nixos.wiki/wiki/Intel_Graphics
  GPU-Intel = false;

  # See: https://github.com/linrunner/TLP
  Power-control = "PPD"; ## Possible options: PPD ; TLP

  # -------------------- System --------------------
  # See https://nixos.wiki/wiki/Bootloader
  # See: https://search.nixos.org/options?show=boot.loader.grub.mirroredBoots
  BootLoader = "systemd-boot"; ## Possible options: grub ; grub-mirror ; systemd-boot

  # See: https://search.nixos.org/options?show=boot.kernelPackages
  # See: https://www.nyx.chaotic.cx/#using-sched-ext-schedulers
  KernelPackages = "linuxPackages_zen";

  # See: https://mynixos.com/nixpkgs/option/system.stateVersion
  StateVersion = "26.05";

  # See: https://docs.moodle.org/405/en/Table_of_locales
  Locale = "en_US.UTF-8";

  # See: https://en.wikipedia.org/wiki/Keyboard_layout
  KeyboardLayout = "us";

  # See: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
  TimeZone = "Asia/Singapore";

  # -------------------- Display --------------------
  WM = "Hyprland"; ## Options: "Hyprland" | "niri" | "sway"

  # See: https://wiki.hyprland.org/Configuring/XWayland/#hidpi-xwayland
  # See: https://github.com/swaywm/sway/wiki#hidpi
  ScaleLevel = "1";

  # See: https://github.com/swaywm/sway/wiki#display-configuration
  OutputSettings = "output * scale 1";

  # See: https://wiki.hyprland.org/Configuring/Monitors
  MonitorSettings = "monitor = , preferred, auto, auto";

  # -------------------- Software --------------------
  # See: https://sing-box.sagernet.org
  SingBox = true;

  # See: https://github.com/qemu/qemu
  # See: https://github.com/virt-manager/virt-manager
  QEMU-VM-Use-Case = false;
}
