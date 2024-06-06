{
  programs.starship = {
    enable = true;
    settings = {
      # "$schema" = "https://starship.rs/config-schema.json";
      add_newline = true;
      command_timeout = 500;
      continuation_prompt = "[∙](bright-black) ";
      format = "$user_f$hostname$directory$line_break$character";
      user_f = {
        format = "\[[$username](yellow)\]";
      };
      right_format = "";
      scan_timeout = 30;
    };
  };
}
