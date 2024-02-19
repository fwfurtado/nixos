{ pkgs, ... }: {
  # Enable Display Manager
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

   # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
        command = "Hyprland";
        user = "me";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    qutebrowser
    mpv
    imv
  ];
}
