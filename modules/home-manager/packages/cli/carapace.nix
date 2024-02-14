{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    carapace
  ];

  programs.carapace.enable = true;
}