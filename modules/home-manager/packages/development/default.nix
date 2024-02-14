{ config, pkgs, ... }:

{
  imports = [
    ./editors/vscode.nix
    ./ides/jetbrains.nix
    ./lsps
  ];
}