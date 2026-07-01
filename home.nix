{ pkgs, ... }:
{
  imports = [
    ./modules/helix.nix
  ];

  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    coreutils
    unzip
    zip
    gitui
    file
    dust
    fzf
    nil
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      zen = "/mnt/c/Program\\ Files/Zen\\ Browser/zen.exe";
      pi = "nix run github:numtide/llm-agents.nix#pi";
    };
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

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "FW-Nagorko";
        email = "fil.wolinski@gmail.com";
      };
      init.defaultBranch = "main";
    };
  };
}
