{ lib, ... }:
{
  options.theme.color = {
    accent = lib.mkOption {
      type = lib.types.str;
      default = "#9cdcfe";
      description = "Primary accent color (light blue)";
    };
    background = lib.mkOption {
      type = lib.types.str;
      default = "#2e2e2e";
      description = "Dark background / selection-highlight color";
    };
    muted = lib.mkOption {
      type = lib.types.str;
      default = "#808080";
      description = "Muted gray for secondary text, borders, decorations";
    };
    plaintext = lib.mkOption {
      type = lib.types.str;
      default = "#d4d4d4";
      description = "Default foreground text color";
    };
    foreground = lib.mkOption {
      type = lib.types.str;
      default = "#ffffff";
      description = "Bright foreground / white";
    };
    black = lib.mkOption {
      type = lib.types.str;
      default = "#000000";
      description = "Pure black";
    };
    warning = lib.mkOption {
      type = lib.types.str;
      default = "#dcdcaa";
      description = "Yellow used for info/prompt/warning text";
    };
    error = lib.mkOption {
      type = lib.types.str;
      default = "#f44747";
      description = "Red used for errors and removed-line markers";
    };
    diffMinusBg = lib.mkOption {
      type = lib.types.str;
      default = "#3b2626";
      description = "Background for removed diff lines";
    };
    diffMinusEmphBg = lib.mkOption {
      type = lib.types.str;
      default = "#5a2f2f";
      description = "Emphasized background for removed diff lines";
    };
    diffPlusBg = lib.mkOption {
      type = lib.types.str;
      default = "#1e3a3a";
      description = "Background for added diff lines";
    };
    diffPlusEmphBg = lib.mkOption {
      type = lib.types.str;
      default = "#2a5555";
      description = "Emphasized background for added diff lines";
    };
  };
}
