{pkgs, ...}: {
  programs.starship = {
    enable = true;
    # settings = pkgs.lib.importTOML ../starship.toml;
    settings = {
      format = "[$username](yellow)[$directory](blue)[$time](white)$newline$character";
      time = {
        disabled = false;
        format = "🕙[\\[$time\\]]($style) ";
        time_format = "%H:%M:%S";
      };
    };
  };
}
