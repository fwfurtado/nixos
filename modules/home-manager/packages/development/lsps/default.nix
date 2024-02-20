{ pkgs, ... }:

{
 home.packages = with pkgs; [
  nil # nix
  gopls
 ];
}