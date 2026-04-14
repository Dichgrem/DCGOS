{inputs, ...}: {
  imports = [inputs.lazyvim.homeManagerModules.default];
  programs.lazyvim = {
    enable = true;
    configFiles = ./lua;
    extras = {
      lang = {
        go.enable = true;
        rust.enable = true;
        python.enable = true;
        typescript.enable = true;
        clangd.enable = true;
        tailwind.enable = true;
        java.enable = true;
        json.enable = true;
        yaml.enable = true;
        toml.enable = true;
        docker.enable = true;
        dart.enable = true;
        kotlin.enable = true;
        nix.enable = true;
      };
    };
  };
}
