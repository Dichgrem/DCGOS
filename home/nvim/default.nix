{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.lazyvim.homeManagerModules.default];
  programs.lazyvim = {
    enable = true;
    configFiles = ./lua;
    extras = {
      lang = {
        go = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        rust = {
          enable = true;
          installDependencies = true;
        };
        python.enable = true;
        typescript.enable = true;
        clangd.enable = true;
        tailwind.enable = true;
        java.enable = true;
        json.enable = true;
        yaml.enable = true;
        toml.enable = true;
        docker.enable = true;
        kotlin.enable = true;
        nix.enable = true;
      };
    };

    extraPackages = with pkgs; [
      #Go
      gotools
      # Nix
      nixd
      # Lua
      lua-language-server
      stylua
      # Rust
      rustfmt
      rust-analyzer
      # Java
      jdt-language-server
      google-java-format
      # C/C++
      clang-tools
      # Shell
      shfmt
      bash-language-server
      # JS/TS
      biome
      vscode-js-debug
      typescript-language-server
      nodePackages.typescript
      # Python
      ruff
      pyright
      # Kotlin
      ktlint
      kotlin-language-server
      # Data formats
      jq
      taplo
      yamlfmt
    ];
  };
}
