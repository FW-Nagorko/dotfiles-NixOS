{ pkgs, ... }:
{
  imports = [
    ./modules/theme.nix
    ./modules/helix.nix
    ./modules/lazygit.nix
    ./modules/shell.nix
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
    nixd
  ];


  programs.npm.enable = true;
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
