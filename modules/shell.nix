{ pkgs, config, ... }:
with config.theme;
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    presets = ["nerd-font-symbols"];
    settings = {
      format = "($directory$cmd_duration$nix_shell$container$fill$git_metrics\n)$hostname$localip$shlvl$shell$env_var$jobs$sudo$username$character";

      right_format = "$singularity$kubernetes$vcsh$fossil_branch$git_branch$git_commit$git_state$git_status$hg_branch$pijul_channel$docker_context$package$c$cpp$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$fortran$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$maven$nim$nodejs$bun$ocaml$opa$perl$php$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$vlang$vagrant$xmake$zig$buf$conda$pixi$meson$spack$memory_usage$aws$gcloud$openstack$azure$crystal$custom$status$os$battery$time";
      fill = {
        symbol = " ";
      };

      git_branch = {
        format = "[ $branch (:$remote_branch)]($style)";
      };

      git_metrics = {
        format = "([+$added]($added_style)) ([-$deleted]($deleted_style)) ";
        added_style = "dimmed green";
        deleted_style = "dimmed red";
        ignore_submodules = true;
        disabled = false;
      };
    };
  };

  programs.zoxide = {
    enableZshIntegration = true;
    enable = true;
  };

  programs.fzf = {
    enableZshIntegration = true;
    enable = true;
    defaultOptions = [
      "--color=fg:${color.plaintext},bg:-1,hl:${color.accent}"
      "--color=fg+:${color.foreground},bg+:${color.background},hl+:${color.accent}"
      "--color=info:${color.warning},prompt:${color.accent},pointer:${color.accent}"
      "--color=marker:${color.accent},spinner:${color.accent},header:${color.muted}"
    ];
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };


  programs.zsh = {
    enable = true;
    shellAliases = {
      zen = "/mnt/c/Program Files/Zen Browser/zen.exe";
      pi = "nix run github:numtide/llm-agents.nix#pi";
      la = "ls -a";
      ll = "ls -l";
    };
    syntaxHighlighting = {
      enable = true;
      styles = {
        comment = "fg=${color.muted}";
        alias = "fg=${color.accent},bold";
        builtin = "fg=${color.accent}";
        function = "fg=${color.accent}";
        command = "fg=${color.accent}";
        precommand = "fg=${color.foreground},italic";
        default = "fg=${color.foreground}";
        arg0 = "fg=${color.foreground}";

        path = "fg=${color.plaintext},underline";
        path_pathseparator = "fg=${color.muted}";

        globbing = "fg=${color.warning}";
        history-expansion = "fg=${color.warning}";

        single-quoted-argument = "fg=${color.accent}";
        double-quoted-argument = "fg=${color.accent}";
        dollar-quoted-argument = "fg=${color.accent}";
        rc-quote = "fg=${color.muted}";

        assign = "fg=${color.foreground}";
        redirection = "fg=${color.warning}";

        unknown-token = "fg=${color.error},bold";
        reserved-word = "fg=${color.accent}";
      };
    };
  };
}
