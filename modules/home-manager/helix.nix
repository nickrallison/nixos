# helix.nix

{
  programs.helix = {
  enable = true;
  settings = {
    theme = "autumn_night_transparent";
    editor.cursor-shape = {
      normal = "block";
      insert = "bar";
      select = "underline";
    };
  };
  languages.language = [{
    name = "nix";
  }];
  themes = {
    autumn_night_transparent = {
      "inherits" = "autumn_night";
      "ui.background" = { };
    };
  };
};
}
