# zsh.nix
{
  programs.zsh = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
      update = "$HOME/rebuild";
    };
    initExtra = ''
      clear
      neofetch
      eval "$(starship init zsh)"
    '';
  };
}
