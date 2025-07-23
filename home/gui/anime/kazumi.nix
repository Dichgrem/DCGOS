{pkgs, ...}: {
  home.packages = with pkgs; [
    kazumi
  ];
}
