{ pkgs, lib, ... }: {
  # Enable Display Manager
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

   # Enable Display Manager
    programs.regreet.enable = true;

    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${lib.getExe pkgs.greetd.tuigreet} --time --cmd Hyprland";
          user = "me";
        };
      };
    };

    environment.systemPackages = with pkgs; [
      greetd.tuigreet
      greetd.wlgreet
      greetd.regreet
    ];
}
