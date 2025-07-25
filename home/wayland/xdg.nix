{config, ...}: {
  xdg = {
    enable = true;
    mimeApps = let
      archiver-extract-smart = ["peazip-extract-smart.desktop"];
      archiver-useless-options = [
        "peazip-extract.desktop"
        "peazip-extract-desktop.desktop"
        "peazip-extract-documents.desktop"
        "peazip-extract-downloads.desktop"
        "peazip-extract-here.desktop"
      ];
      browser = ["floorp.desktop"];
      editor = ["neovim"];
      filemanager = ["nemo.desktop"];
      image-viewer = ["oculante.desktop"];
      media-player = ["vlc.desktop"];
    in {
      associations = {
        added = {
          "application/x-directory" = ["peazip-add-to-archive.desktop"];
          "inode/directory" = ["peazip-add-to-archive.desktop"];
        };
        removed = {
          "application/iso" = archiver-useless-options;
          "application/x-7z-compressed" = archiver-useless-options;
          "application/x-ace-compressed" = archiver-useless-options;
          "application/x-bzip2" = archiver-useless-options;
          "application/x-gzip" = archiver-useless-options;
          "application/x-rar-compressed" = archiver-useless-options;
          "application/x-tar" = archiver-useless-options;
          "application/zip" = archiver-useless-options;
        };
      };
      enable = true;
      defaultApplications = {
        "application/iso" = archiver-extract-smart;
        "application/zip" = archiver-extract-smart;
        "application/x-7z-compressed" = archiver-extract-smart;
        "application/x-ace-compressed" = archiver-useless-options;
        "application/x-bzip2" = archiver-extract-smart;
        "application/x-gzip" = archiver-extract-smart;
        "application/x-rar-compressed" = archiver-extract-smart;
        "application/x-tar" = archiver-extract-smart;

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

        "application/x-wine-extension-ini" = editor;
        "text/plain" = editor;

        "x-scheme-handler/about" = filemanager;
        "x-scheme-handler/ftp" = filemanager;

        "image/*" = image-viewer;
        "image/avif" = image-viewer;
        "image/gif" = image-viewer;
        "image/jpeg" = image-viewer;
        "image/png" = image-viewer;
        "image/webp" = image-viewer;

        "audio/*" = media-player;
        "video/*" = media-player;

        "x-scheme-handler/tg" = ["io.github.kukuruzka165.materialgram.desktop"];
      };
    };
    portal = {
      config = {
        common = {
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
        };
      };
      enable = true;
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
