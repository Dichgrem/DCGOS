{
  inputs,
  pkgs,
  ...
}: let
  llm-agents = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system};
in {
  home.packages = [
    llm-agents.pi
    llm-agents.qmd
  ];

  home.file.".pi/agent/settings.json" = {
    text = builtins.toJSON {
      packages = [
        "npm:pi-mcp-adapter"
        "npm:@narumitw/pi-lsp"
        "npm:@narumitw/pi-plan-mode"
        "npm:@narumitw/pi-subagents"
        "npm:pi-memory"
        "npm:pi-cache-optimizer"
        "npm:pi-btw"
        "npm:pi-grilling-skill"
      ];
    };
  };
}
