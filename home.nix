{ pkgs, ... }:
{
  imports = [
    ./modules/helix.nix
    ./modules/lazygit.nix
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    coreutils
    unzip
    zip
    glow
    file
    dust
    nil
  ];


  programs.bash = {
    enable = true;
    shellAliases = {
      zen = "/mnt/c/Program\\ Files/Zen\\ Browser/zen.exe";
      pi = "nix run github:numtide/llm-agents.nix#pi";
      la = "ls -a";
      ll = "ls -l";
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultOptions = [
      "--color=fg:#d4d4d4,bg:-1,hl:#9cdcfe"
      "--color=fg+:#ffffff,bg+:#2e2e2e,hl+:#9cdcfe"
      "--color=info:#dcdcaa,prompt:#9cdcfe,pointer:#9cdcfe"
      "--color=marker:#9cdcfe,spinner:#9cdcfe,header:#808080"
    ];
  };

  programs.npm.enable = true;
  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
  };

  programs.starship.enable = true;
  programs.ssh = {
    enable = true;
    addKeysToAgent = "yes";
      matchBlocks = {
      "github.com" = {
        identityFile = "~/.ssh/github_ed25519";
      };
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    NIXPKGS_ALLOW_UNFREE = 1;
  };
}
