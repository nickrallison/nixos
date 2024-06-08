# zsh.nix
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "$HOME/rebuild";
    };
    initExtra = ''
    eval "$(starship init zsh)"
    ''
  };
}
