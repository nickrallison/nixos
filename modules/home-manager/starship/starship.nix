# starship.nix
{
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
