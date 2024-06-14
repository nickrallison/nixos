# firefox.nix
{
  programs.firefox = {
    enable = true;
    arkenfox = {
      enable = true;
      version = "103.0";
    };

    profiles.Default.arkenfox = {
      enable = true;
      "0000".enable = true;
    };
  };
}
