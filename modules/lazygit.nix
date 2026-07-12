{ config, ... }:
with config.theme;
{
  programs.delta = {
    enable = true;
    options = {
      dark = true;
      line-numbers = true;
      side-by-side = false;
      syntax-theme = "Visual Studio Dark+";

      file-style = "${color.accent} bold";
      file-decoration-style = "${color.muted} ul";

      hunk-header-style = "syntax";
      hunk-header-decoration-style = "${color.background} box";

      line-numbers-left-format = "";
      line-numbers-right-format = "│ ";
      line-numbers-minus-style = color.error;
      line-numbers-plus-style = color.accent;
      line-numbers-zero-style = color.muted;

      minus-style = "syntax ${color.diffMinusBg}";
      minus-emph-style = "syntax ${color.diffMinusEmphBg}";
      plus-style = "syntax ${color.diffPlusBg}";
      plus-emph-style = "syntax ${color.diffPlusEmphBg}";

      whitespace-error-style = "${color.error} reverse";
    };
  };

  programs.git = {
    enable = true;
    settings = {
      user = {
        name  = "FW-Nagorko";
        email = "fil.wolinski@gmail.com";
      };
      core = {
        pager = "delta";
      };
      init.defaultBranch = "main";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        branchLogCmd =
          "git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=format:'%C(${color.accent})%h%C(reset) %C(${color.warning})%d%C(reset)%n%s%n%C(${color.muted})%an, %ar%C(reset)%n' {{branchName}} --";
        pagers = [
          {pager = "delta --dark --paging=never";}
        ];
      };
      notARepository = "skip";
      gui = {
        nerdFontsVersion = 2;
        border = "single";
        spinner = {
          frames = [ "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" ];
          rate = 50;
        };
        theme = {
          activeBorderColor = [ color.accent "bold" ];
          inactiveBorderColor = [ color.muted ];
          searchingActiveBorderColor = [ color.warning "bold" ];
          optionsTextColor = [ color.accent ];
          selectedLineBgColor = [ color.background ];
          inactiveViewSelectedLineBgColor = [ color.background ];
          cherryPickedCommitFgColor = [ color.accent ];
          cherryPickedCommitBgColor = [ color.background ];
          markedBaseCommitFgColor = [ color.black ];
          markedBaseCommitBgColor = [ color.accent ];
          unstagedChangesColor = [ color.error ];
          defaultFgColor = [ "default" ];
        };
      };
    };
  };
}
