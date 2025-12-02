{
  hostname,
  lib,
  pkgs,
  ...
}: let
  inherit (import ../../hosts/${hostname}/env.nix) WM;
in
  with lib;
    mkIf (WM == "niri") {
      home.packages = with pkgs; [
        niri
        xwayland-satellite
      ];
      systemd.user.services.xdg-desktop-portal-gtk = {
        Unit = {
          Description = "Portal service (GTK implementation)";
          PartOf = ["graphical-session.target"];
          After = ["graphical-session.target"];
        };
        Service = {
          Type = "dbus";
          BusName = "org.freedesktop.impl.portal.desktop.gtk";
          ExecStart = "${pkgs.xdg-desktop-portal-gtk}/libexec/xdg-desktop-portal-gtk";
          Slice = "session.slice";
        };
        Install = {
          WantedBy = ["xdg-desktop-portal.service"];
        };
      };
      systemd.user.targets.niri-session = {
        Unit = {
          After = "graphical-session-pre.target graphical-session.target";
          BindsTo = "graphical-session.target";
          Conflicts = "shutdown.target";
          DefaultDependencies = false;
          Description = "niri compositor session";
          Documentation = "man:systemd.special(7)";
          Wants = "graphical-session-pre.target";
        };
      };
      xdg.portal = {
        enable = true;
        config = {
          common = {
            default = ["gtk"];
            "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
            "org.freedesktop.impl.portal.ScreenCast" = "gnome";
            "org.freedesktop.impl.portal.Screenshot" = "gnome";
          };
        };
        extraPortals = [
          pkgs.xdg-desktop-portal-gtk
          pkgs.xdg-desktop-portal-gnome
        ];
      };
    }
