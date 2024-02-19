{ pkgs, ...}:

{
  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland = {
        enable = true;
      };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  services.gnome.gnome-keyring.enable = true;
}