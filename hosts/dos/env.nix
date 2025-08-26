{
  # Specific Use Cases
  ## Hardware related
  Bluetooth = true;
  ### See https://github.com/blueman-project/blueman

  GPU-AMD = true;
  ### See https://nixos.wiki/wiki/AMD_GPU

  GPU-Nvidia = false;
  ### See https://nixos.wiki/wiki/Nvidia

  GPU-Intel = false;
  ### See https://nixos.wiki/wiki/Intel_Graphics

  HotSpot-Use-Case = false;
  ### See https://nixos.wiki/wiki/Internet_Connection_Sharing

  ## Software related
  QEMU-VM-Use-Case = true;
  ### See https://github.com/qemu/qemu ; https://github.com/virt-manager/virt-manager

  # Options
  ## System related
  BootLoader = "systemd-boot";
  ### Possible options: grub ; grub-mirror ; systemd-boot # See https://nixos.wiki/wiki/Bootloader https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=mirroredBoots

  KernelPackages = "linuxPackages_cachyos";
  ### See https://search.nixos.org/options?show=boot.kernelPackages https://www.nyx.chaotic.cx/#using-sched-ext-schedulers

  KeyboardLayout = "us";
  ### See https://en.wikipedia.org/wiki/Keyboard_layout

  Locale = "en_US.UTF-8";
  ### See https://docs.moodle.org/405/en/Table_of_locales

  StateVersion = "25.05";
  ### See https://mynixos.com/nixpkgs/option/system.stateVersion

  TimeZone = "Asia/Singapore";
  ### See https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

  ## Wayland related
  MonitorSettings = "monitor=eDP-1, preferred, auto, 1.25";
  ### MonitorSettings For Hyprland See https://wiki.hyprland.org/Configuring/Monitors/

  OutputSettings = "output * scale 1";
  ### OutputSettings For sway See https://github.com/swaywm/sway/wiki#display-configuration

  ScaleLevel = "1";
  ### For Hyprland see https://wiki.hyprland.org/Configuring/XWayland/#hidpi-xwayland
  ### For sway see https://github.com/swaywm/sway/wiki#hidpi

  WM = "Hyprland";
  ### Possible options: Hyprland ; niri ; sway
}
