
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
  ];

  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
      batgrep
      batwatch
    ];
  };
}