{  pkgs, ... }:

{

  imports = [
    ./cli
    ./development
    ./shells
    ./terminals
    ./wm
  ];

  # Uncategorised packages
  home.packages = with pkgs; [
    _1password-gui
    google-chrome
    variety
    steam
    slack
    zoom
    zip
    unzip
    tlrc
    flameshot
    go
    rust-bin.stable.latest.default
  ];
}