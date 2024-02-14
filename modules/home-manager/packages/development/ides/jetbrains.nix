{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    jetbrains.rust-rover
    jetbrains.goland
    jetbrains.rider
    jetbrains.datagrip
    jetbrains-mono
  ];
}