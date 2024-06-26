# home.nix
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager/helix.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/tmux.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/firefox.nix
  ];

  home.username = "nick";
  home.homeDirectory = "/home/nick";
  home.stateVersion = "24.05"; # Please read the docs before changing.

  home.packages = [
  ];

  # Manage dotfiles
  # home.file = {
  #   ".zshrc" = {
  #     enable = true;
  #     source = ../../modules/home-manager/zsh/zshrc;
  #   };
  # };

  # xdg.configFile."starship.toml".source = ../../modules/home-manager/starship/starship.toml;

  # Manage env vars
  home.sessionVariables = {
    # STARSHIP_CONFIG = "../../modules/home-manager/starship/starship.toml";
    EDITOR = "hx";
    # DISPLAY = "0.0";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
