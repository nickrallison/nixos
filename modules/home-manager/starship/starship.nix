{pkgs, ...}: {
  programs.starship = {
    enable = true;
    # settings = pkgs.lib.importTOML ../starship.toml;
    settings = {
      format = "[\\[$custom.userid\\]](yellow)[$directory](blue)$line_break$character";
      time = {
        disabled = false;
        format = "🕙[\\[$time\\]]($style) ";
        time_format = "%H:%M:%S";
      };
      custom.userid = {
        command = "echo $USER";
        format = "[$output]($style)";
      };
    };
  };
}
