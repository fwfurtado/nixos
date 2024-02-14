{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    disfetch
    onefetch
    neofetch
    screenfetch
  ];

}