{pkgs, ...}:
{
  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    powerline
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    comic-mono
    iosevka
    font-awesome
    ubuntu_font_family
    terminus_font
    (nerdfonts.override { fonts = [ "Inconsolata" ]; })
    inconsolata
    inconsolata-nerdfont
  ];
}