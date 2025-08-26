{pkgs, ...}: {
  home.packages = with pkgs; [
    gui-for-singbox
  ];
}
