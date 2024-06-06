{
  programs.starship = {
    enable = true;
    settings = {
      # "$schema" = "https://starship.rs/config-schema.json";
      add_newline = true;
      command_timeout = 500;
      continuation_prompt = "[∙](bright-black) ";
      format = "[[$username@$hostname](yellow)([$directory](blue))[❯](white)";
      right_format = "";
      scan_timeout = 30;
    };
  };
}
