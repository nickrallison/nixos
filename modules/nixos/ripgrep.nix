# ripgrep.nix

{ config, pkgs, ... }

{
  environment.systemPackages = [
    pkgs.ripgrep
  ];

}
