{ config, pkgs, ... }:

{
  imports = [
    ./packages
    ./shell
  ];
}