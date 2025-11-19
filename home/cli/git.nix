{ pkgs, ... }: {
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
  };

  programs.gh.enable = true;

  home.packages = with pkgs; [
    git-filter-repo
  ];
}
