# starship.nix
{
  config,
  pkgs,
  ...
}: {
  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;
      command_timeout = 1000;
      format = "$username";
      character = {
        success_symbol = "[❯](bright-cyan)";
        error_symbol = "[❯](red)";
      };
      username = {
        style_user = "white";
        style_root = "white";
        format = "[$user]($style) ";
        disabled = false;
        show_always = true;
      };
      hostname = {
        ssh_only = false;
        format = "@ [$hostname](bold yellow) ";
        disabled = false;
      };
      directory = {
        home_symbol = "~";
        read_only_style = "197";
        read_only = "";
        format = "at [$path]($style)[$read_only]($read_only_style) ";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
    };
  };
}
