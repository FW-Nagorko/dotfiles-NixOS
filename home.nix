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

  programs.bash.enable = true;

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

  programs.starship.enable = true;
  programs.ssh.enable = true;

  programs.git.enable = true;
  
}
