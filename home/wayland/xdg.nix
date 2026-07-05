{config, ...}: {
  xdg = {
    enable = true;
    mimeApps = let
      browser = ["firefox.desktop"];
      editor = ["dev.zed.Zed.desktop"];
      filemanager = ["nemo.desktop"];
      image-viewer = ["org.gnome.Loupe.desktop"];
      media-player = ["vlc.desktop"];
    in {
      enable = true;

      defaultApplications = {
        # Browser
        "application/json" = browser;
        "application/pdf" = browser;
        "application/rdf+xml" = browser;
        "application/rss+xml" = browser;
        "application/xhtml+xml" = browser;
        "application/xhtml_xml" = browser;
        "application/xml" = browser;
        "application/x-extension-htm" = browser;
        "application/x-extension-html" = browser;
        "application/x-extension-shtml" = browser;
        "application/x-extension-xht" = browser;
        "application/x-extension-xhtml" = browser;
        "text/html" = browser;
        "text/xml" = browser;
        "x-scheme-handler/http" = browser;
        "x-scheme-handler/https" = browser;
        "x-scheme-handler/unknown" = browser;
        # Editor
        "application/x-wine-extension-ini" = editor;
        "text/plain" = editor;
        # File manager
        "x-scheme-handler/about" = filemanager;
        "x-scheme-handler/ftp" = filemanager;
        # Images
        "image/avif" = image-viewer;
        "image/bmp" = image-viewer;
        "image/gif" = image-viewer;
        "image/jpeg" = image-viewer;
        "image/jpg" = image-viewer;
        "image/png" = image-viewer;
        "image/svg+xml" = image-viewer;
        "image/tiff" = image-viewer;
        "image/webp" = image-viewer;
        # Media
        "audio/*" = media-player;
        "video/*" = media-player;
        # Custom URI schemes
        "x-scheme-handler/mpv" = ["mpv.desktop"];
        "x-scheme-handler/tg" = [
          "io.github.kukuruzka165.materialgram.desktop"
        ];
      };
    };

    portal = {
      enable = true;
      config = {
        common = {
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
        };
      };
    };

    userDirs = {
      enable = true;
      createDirectories = false;
      documents = "$HOME/Documents";
      download = "$HOME/Downloads";
      music = "$HOME/Music";
      pictures = "$HOME/Pictures";
      publicShare = "/var/empty";
      templates = "/var/empty";
      videos = "$HOME/Videos";
      extraConfig = {
        XDG_SCREENSHOTS_DIR = "${config.xdg.userDirs.pictures}/Screenshots";
      };
    };
  };
}
