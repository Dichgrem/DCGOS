{pkgs, ...}: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    settings = {
      user = {
        name = "dichgrem";
        email = "brcefy@gmail.com";
      };
    };

    lfs.enable = true;
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;

    options = {
      side-by-side = true;
      line-numbers = true;
      navigate = true;
      syntax-theme = "Dracula";
    };
  };

  programs.gh.enable = true;

  home.packages = with pkgs; [
    git-filter-repo
    onefetch
    tig
  ];
}
