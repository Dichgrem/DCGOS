{pkgs, ...}: {
  home.packages = [
    (pkgs.writeShellScriptBin "bluetui" ''
      rfkill unblock bluetooth
      ${pkgs.bluetui}/bin/bluetui
    '')
  ];
}
