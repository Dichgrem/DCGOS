{pkgs, ...}:
let
  chromiumZh = pkgs.symlinkJoin {
    name = "chromium-zh-CN";
    paths = [pkgs.chromium];
    nativeBuildInputs = [pkgs.makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/chromium \
        --run 'export LANGUAGE=zh_CN:zh' \
        --add-flags '--password-store=basic'
    '';
  };
in {
  home.packages = [chromiumZh];
}
