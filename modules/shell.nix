{ pkgs, config, ... }:
with config.theme;
let
  blesh = pkgs.stdenv.mkDerivation {
    pname = "blesh";
    version = "0.4.0-devel3";
    src = pkgs.fetchurl {
      url = "https://github.com/akinomyoga/ble.sh/releases/download/v0.4.0-devel3/ble-0.4.0-devel3.tar.xz";
      sha256 = "sha256-yGEu5hK8axDb/W6Fxsvf18rxUqEtH53iLqCp1zWzCAw=";
    };
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/blesh
      cp -r ./* $out/share/blesh/
    '';
  };
in
{
  programs.starship = {
    enable = true;
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
    enable = true;
  };

  programs.fzf = {
    enable = true;
    defaultOptions = [
      "--color=fg:${color.plaintext},bg:-1,hl:${color.accent}"
      "--color=fg+:${color.foreground},bg+:${color.background},hl+:${color.accent}"
      "--color=info:${color.warning},prompt:${color.accent},pointer:${color.accent}"
      "--color=marker:${color.accent},spinner:${color.accent},header:${color.muted}"
     ];
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      zen = "/mnt/c/Program Files/Zen Browser/zen.exe";
      pi = "nix run github:numtide/llm-agents.nix#pi";
      la = "ls -a";
      ll = "ls -l";
    };

    initExtra = ''
      [[ $- == *i* ]] && source "${blesh}/share/blesh/ble.sh" --attach=none --rcfile /dev/null

      bleopt complete_auto_complete=
      bleopt complete_auto_history=
      bleopt complete_ambiguous=
      bleopt complete_menu_complete=
      bleopt complete_menu_filter=
      bleopt prompt_eol_mark=
      bleopt exec_errexit_mark=
      bleopt char_width_mode=west

      if [[ $TERM != "dumb" ]]; then
        eval "$(${pkgs.starship}/bin/starship init bash --print-full-init)"
      fi

      eval "$(${pkgs.zoxide}/bin/zoxide init bash)"

      if [[ ''${BLE_VERSION-} ]]; then
        ble-attach
        ble-import -d integration/fzf-completion
        ble-import -d integration/fzf-key-bindings
      fi
    '';
  };
}
