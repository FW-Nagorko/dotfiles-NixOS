{ config, pkgs, ... }:
{
  home.username = "fwolinski";
  home.homeDirectory = "/home/fwolinski";

  home.stateVersion = "26.05";

  imports = [
    ./modules/theme.nix
    ./modules/lazygit.nix
    ./modules/helix.nix
    ./modules/shell.nix
  ];

  home.packages = with pkgs; [
     nerd-fonts.commit-mono
     unzip
     zip
     glow
     file
     xsel
     dust
     nil
  ];

  programs.kitty = {
    enable = true;
    package = pkgs.runCommand "empty" {} "mkdir -p $out";
    settings = {
      
      shell = "${pkgs.zsh}/bin/zsh";
      font_family = "CommitMono Nerd Font";
      font_size = 12;
      scrollback_lines = 10000;
      enable_audio_bell = false;
    };
  };

  home.sessionVariables = {
    EDITOR = "hx";
    NIXPKGS_ALLOW_UNFREE = 1;
  };

  programs.home-manager.enable = true;
}
