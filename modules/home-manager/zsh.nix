# zsh.nix
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "$HOME/rebuild";
    };
    # prezto.tmux.autoStartLocal = true;
    # prezto.tmux.autoStartRemote = true;
    prezto.tmux.defaultSessionName = "home";
    initExtra = ''
      # clear
      if [[ "$TMUX" == "" ]]; then
        tmux new-session -A -s mysession
        echo not tmux
      else
        echo yes tmux
      fi
      neofetch
      eval "$(starship init zsh)"
    '';
  };
}
