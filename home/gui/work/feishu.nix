{pkgs, ...}: {
  home.packages = with pkgs; [
    feishu
  ];
}
