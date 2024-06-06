# home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager/helix.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/zsh.nix
    # ../../modules/home-manager/starship/starship.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.05"; # Please read the docs before changing.

  home.packages = [
  ];

  # Manage dotfiles
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Manage env vars
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
