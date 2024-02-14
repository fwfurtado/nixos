{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    outils
    pavucontrol
    libnotify
    todo-txt-cli
    calcurse
    mpc-cli
    playerctl
    brightnessctl
  ];

  home.file."${config.xdg.configHome}/eww/bar" = {
    source = ./bar;
    recursive = true;
  };

  home.file."${config.xdg.configHome}/eww/dashboard" = {
    source = ./dashboard;
    recursive = true;
  };
}