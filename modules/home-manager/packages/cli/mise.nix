{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    mise
  ];

  programs.mise.enable = true;
}