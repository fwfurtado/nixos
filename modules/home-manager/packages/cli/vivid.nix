{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    vivid
  ];

  # programs.zoxide.enable = true;
}