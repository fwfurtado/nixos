{ config, pkgs, ... }:

{

  imports = [
    ./awscli.nix
    ./bat.nix
    ./direnv.nix
    ./distro-fetchers.nix
    ./gh.nix
    ./make.nix
    ./mise.nix
    ./starship.nix
    ./task.nix
    ./vivid.nix
    ./xsel.nix
    ./zoxide.nix
  ];
}