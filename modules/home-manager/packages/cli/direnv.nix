{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    direnv
    nix-direnv
  ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}