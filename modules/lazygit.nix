{
  programs.delta = {
    enable = true;
    options = {
      dark = true;
      line-numbers = true;
      side-by-side = false;
      syntax-theme = "Visual Studio Dark+";

      file-style = "#9cdcfe bold";
      file-decoration-style = "#808080 ul";

      hunk-header-style = "syntax";
      hunk-header-decoration-style = "#2e2e2e box";

      line-numbers-left-format = "";
      line-numbers-right-format = "│ ";
      line-numbers-minus-style = "#f44747";
      line-numbers-plus-style = "#9cdcfe";
      line-numbers-zero-style = "#808080";

      minus-style = "syntax #3b2626";
      minus-emph-style = "syntax #5a2f2f";
      plus-style = "syntax #1e3a3a";
      plus-emph-style = "syntax #2a5555";

      whitespace-error-style = "#f44747 reverse";
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
          "git log --graph --color=always --abbrev-commit --decorate --date=relative --pretty=format:'%C(#9cdcfe)%h%C(reset) %C(#dcdcaa)%d%C(reset)%n%s%n%C(#808080)%an, %ar%C(reset)%n' {{branchName}} --";
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
          activeBorderColor = [ "#9cdcfe" "bold" ];
          inactiveBorderColor = [ "#808080" ];
          searchingActiveBorderColor = [ "#dcdcaa" "bold" ];
          optionsTextColor = [ "#9cdcfe" ];
          selectedLineBgColor = [ "#2e2e2e" ];
          inactiveViewSelectedLineBgColor = [ "#2e2e2e" ];
          cherryPickedCommitFgColor = [ "#9cdcfe" ];
          cherryPickedCommitBgColor = [ "#2e2e2e" ];
          markedBaseCommitFgColor = [ "#000000" ];
          markedBaseCommitBgColor = [ "#9cdcfe" ];
          unstagedChangesColor = [ "#f44747" ];
          defaultFgColor = [ "default" ];
        };
      };
    };
  };
}
