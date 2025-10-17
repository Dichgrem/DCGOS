{
  config,
  lib,
  pkgs,
  ...
}: let
  neo-tree-nvim-main = pkgs.vimUtils.buildVimPlugin {
    pname = "neo-tree-nvim-main";
    version = "3.35.2+6";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neo-tree";
      repo = "neo-tree.nvim";
      rev = "8dd9f08ff086d09d112f1873f88dc0f74b598cdb";
      sha256 = "sha256-edthaqznGTJ+VFVORK7gfHI9J14PLAghG9prsWlzXtc=";
    };
    doCheck = false;
    meta.homepage = "https://github.com/nvim-neo-tree/neo-tree.nvim/";
    meta.hydraPlatforms = [];
  };
in {
  programs.neovim = {
    enable = true;
    extraPackages = with pkgs; [
      # LazyVim
      lua-language-server
      stylua
    ];

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    extraLuaConfig = let
      plugins = with pkgs.vimPlugins; [
        LazyVim
        bufferline-nvim
        cmp_luasnip
        conform-nvim
        dashboard-nvim
        flash-nvim
        friendly-snippets
        gitsigns-nvim
        lualine-nvim
        {
          name = "neo-tree.nvim";
          path = neo-tree-nvim-main;
        }
        neoconf-nvim
        neodev-nvim
        noice-nvim
        nui-nvim
        nvim-lint
        nvim-lspconfig
        nvim-notify
        nvim-spectre
        nvim-treesitter
        nvim-treesitter-context
        nvim-treesitter-textobjects
        nvim-ts-autotag
        nvim-ts-context-commentstring
        nvim-web-devicons
        persistence-nvim
        plenary-nvim
        todo-comments-nvim
        tokyonight-nvim
        trouble-nvim
        vim-illuminate
        vim-startuptime
        which-key-nvim
        fzf-lua
        snacks-nvim
        {
          name = "lazydev.nvim";
          path = lazydev-nvim;
        }
        {
          name = "blink.cmp";
          path = blink-cmp;
        }
        {
          name = "LuaSnip";
          path = luasnip;
        }
        {
          name = "mini.ai";
          path = mini-nvim;
        }
        {
          name = "mini.bufremove";
          path = mini-nvim;
        }
        {
          name = "mini.comment";
          path = mini-nvim;
        }
        {
          name = "mini.indentscope";
          path = mini-nvim;
        }
        {
          name = "mini.pairs";
          path = mini-nvim;
        }
        {
          name = "mini.surround";
          path = mini-nvim;
        }
        {
          name = "mini.icons";
          path = mini-icons;
        }
        {
          name = "grug-far.nvim";
          path = grug-far-nvim;
        }
      ];
      mkEntryFromDrv = drv:
        if lib.isDerivation drv
        then {
          name = "${lib.getName drv}";
          path = drv;
        }
        else drv;
      lazyPath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);
    in ''
      require("lazy").setup({
        defaults = {
          lazy = true,
        },
        dev = {
          -- reuse files from pkgs.vimPlugins.*
          path = "${lazyPath}",
          patterns = { "." },
          -- fallback to download
          fallback = true,
        },
        rocks = {
          enabled = false,
          hererocks = false,
        },
        spec = {
          { "LazyVim/LazyVim", import = "lazyvim.plugins" },
          -- The following configs are needed for fixing lazyvim on nix
          -- disable mason.nvim, use programs.neovim.extraPackages
          { "mason-org/mason-lspconfig.nvim", enabled = false },
          { "mason-org/mason.nvim", enabled = false },
          -- import/override with your plugins
          { import = "lazyvim.plugins.extras.lang.go" },
          { import = "lazyvim.plugins.extras.lang.clangd" },
          { import = "lazyvim.plugins.extras.lang.rust" },
          { import = "lazyvim.plugins.extras.lang.typescript" },
          { import = "lazyvim.plugins.extras.lang.python" },
          { import = "lazyvim.plugins.extras.lang.tailwind" },
          { import = "lazyvim.plugins.extras.lang.java" },
          { import = "lazyvim.plugins.extras.lang.json" },
          { import = "lazyvim.plugins.extras.lang.yaml" },
          { import = "lazyvim.plugins.extras.lang.toml" },
          { import = "lazyvim.plugins.extras.lang.docker" },
          { import = "plugins" },
          -- treesitter handled by xdg.configFile."nvim/parser", put this line at the end of spec to clear ensure_installed
          { "nvim-treesitter/nvim-treesitter",
           opts = function(_, opts)
            opts.ensure_installed = {}
          end,
          },
        },
      })
    '';
  };

  # https://github.com/nvim-treesitter/nvim-treesitter#i-get-query-error-invalid-node-type-at-position
  xdg.configFile."nvim/parser".source = let
    parsers = pkgs.symlinkJoin {
      name = "treesitter-parsers";
      paths =
        (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins:
          with plugins; [
            bash
            c
            lua
            python
            go
            rust
            java
            javascript
            typescript
            tsx
            vue
            html
            css
            json
            yaml
            toml
            dockerfile
          ]))
        .dependencies;
    };
  in "${parsers}/parser";

  # Normal LazyVim config here, see https://github.com/LazyVim/starter/tree/main/lua
  xdg.configFile."nvim/lua".source = ./lua;

  # Set default editor
  home.sessionVariables.EDITOR = "nvim";
}