{ pkgs, ... }:
{
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    coreutils
    unzip
    zip
    gitui
    file
    dust
    fzf
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      zen = "/mnt/c/Program\\ Files/Zen\\ Browser/zen.exe";
      pi = "nix run github:numtide/llm-agents.nix#pi";
    };
  };

  programs.helix = {
    enable = true;
    settings = {
      theme = "transparent_plus";
      editor = {
        true-color = true;
        bufferline = "multiple";
        color-modes = true;
        auto-format = true;
        soft-wrap.enable = true;
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
      keys.normal = {
        C-s = [ ":w" ];
        C-t = "file_picker";
        C-j = [ "extend_to_line_bounds" "delete_selection" "paste_after" ];
        C-k = [ "extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before" ];
        C-h = ":buffer-previous";
        C-l = ":buffer-next";
        C-w = ":buffer-close";
      };
    };
    themes = {
      transparent_plus = {
        inherits = "dark_plus";
        "ui.background" = { };
        "ui.statusline" = { bg = "dark-gray"; };
        "ui.bufferline.active" = { fg = "black"; bg = "light-blue"; };
        palette = {
          dark-gray = "#2e2e2e";
          light-blue = "#9cdcfe";
        };
      };
    };
  };

  programs.npm.enable = true;
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
