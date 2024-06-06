{pkgs, ...}: {
  programs.starship = {
    enable = true;
    # settings = pkgs.lib.importTOML ../starship.toml;
    settings = {
      format = "[\\[\$\{custom.useridtemp\}\\]](yellow)[$directory](blue)$line_break$character";
      time = {
        disabled = false;
        format = "🕙[\\[$time\\]]($style) ";
        time_format = "%H:%M:%S";
      };
      custom.useridtemp = {
        command = "echo $USER";
        format = "[$output]($style)";
      };
    };
  };
}
