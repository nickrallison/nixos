# zsh.nix
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "$HOME/rebuild";
    };
    history = {
      size = 10000;
      path = "$ENV{HOME}/dotfiles/zsh/history";
    };
  };
}
