{ pkgs, lib, config, ... }:
let
  userConfig = config.home-manager.users.me;
  # gtkTheme = userConfig.gtk.theme;
  # iconTheme = userConfig.gtk.iconTheme;
  # wallpaper = userConfig.wallpaper;

in {
  # Enable Display Manager
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

   # Enable Display Manager
    programs.regreet = {
      enable = true;
      # settings = {
      #   GTK = {
      #     icon_theme_name = "Papirus";
      #     # theme_name = gtkTheme.name;
      #   };
      #   background = {
      #     path = wallpaper;
      #     fit = "Cover";
      #   };
      # };
    };

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${lib.getExe config.programs.regreet.package}";
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
