{ inputs, config, lib, pkgs, ... }:
{
  imports = [ inputs.lazyvim.homeManagerModules.default ];
  programs.lazyvim = {
    enable = true;

    configFiles = ./lua;

    extras = {
      lang = {
        go.enable = true;
        clangd.enable = true;
        rust.enable = true;
        typescript.enable = true;
        python.enable = true;
        tailwind.enable = true;
        java.enable = true;
        json.enable = true;
        yaml.enable = true;
        toml.enable = true;
        docker.enable = true;
        kotlin.enable = true;
        # dart.enable = true;
        nix.enable = true;
      };
    };

    extraPackages = with pkgs; [
      # All
      tree-sitter

      # Go
      gopls
      gofumpt
      golines

      # Lua
      stylua
      lua-language-server

      # Nix
      nixd
      nixpkgs-fmt

      # Java
      google-java-format
      jdt-language-server

      # Rust
      clippy
      rustfmt
      rust-analyzer

      # Shell
      shfmt
      bash-language-server

      # C/C++
      clang-tools

      # Kotlin
      ktlint
      kotlin-language-server

      # Python
      ruff
      black
      python312Packages.python-lsp-server

      # JS/TS/Web
      biome
      prettierd
      nodePackages.prettier

      # Data formats
      jq #JSON
      taplo #TOML
      yamlfmt #YAML
    ];
  };
}
