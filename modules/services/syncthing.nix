{username, ...}: {
  services.syncthing = {
    enable = true;
    user = username;
    configDir = "/home/${username}/.config/syncthing";
    guiAddress = "127.0.0.1:8384";
  };
}
