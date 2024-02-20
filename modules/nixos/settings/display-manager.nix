{ pkgs, ... }: {
  # Enable Display Manager
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

   # Enable Display Manager
    programs.regreet.enable = true;

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd Hyprland";
          user = "me";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      greetd.tuigreet
      greetd.regreet
      qutebrowser
      mpv
      imv
    ];
}
