{ pkgs, config, ... }:

{

  imports = [
    ./eww
    ./swaylock.nix
  ];

  home.packages = with pkgs; [
    hyprland-protocols
    hyprpicker
    hyprpaper
    waybar
    eww-wayland
    mako
    pipewire
    wireplumber
    swww
    swayidle
    wofi
    cliphist
    xdg-utils
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    libsForQt5.qt5.qtwayland
    qt6.qtwayland
    libsForQt5.polkit-kde-agent
    wl-clipboard
    wlr-randr
    fuzzel
    swayosd
    wluma
    qutebrowser
    mpv
    imv
    wlogout
  ];

  gtk.cursorTheme = {
    package = pkgs.quintom-cursor-theme;
    name = "Quintom_Ink";
    size = 36;
  };


  wayland.windowManager.hyprland = {
    # Whether to enable Hyprland wayland compositor
    enable = true;

    # Whether to enable XWayland
    # xwayland.enable = true;

    # Optional
    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;

    # Must be enabled in flake.nix before add theses statments:
    # plugins = [
    #     inputs.plugin_name.packages.${pkgs.system}.default
    # ];

    settings = {

      "$mod" = "SUPER";
      "$mainMod" = "SUPER";
      "$menu" = "fuzzel";
      "$terminal" = "wezterm start --new-tab";

      exec-once = [
        "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
        "waybar"
        # "eww daemon"
        # "hyprctl setcursor ${config.gtk.cursorTheme.name} ${builtins.toString config.gtk.cursorTheme.size}"
        "swww init"
        "wl-paste --type text  --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "swayidle -w timeout 300 '${config.programs.swaylock.package}/bin/swaylock -f' timeout 210 'suspend-unless-render' resume '${pkgs.hyprland}/bin/hyprctl dispatch dpms on' before-sleep ${config.programs.swaylock.package}/bin/swaylock -f"
        "mako"
        "swayosd-server"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 5;
        border_size = 1;
        "col.active_border" = "rgba(88888888)";
        "col.inactive_border" = "rgba(00000088)";

        allow_tearing = true;
        resize_on_border = true;
        layout = "dwindle";

      };

      decoration = {
        rounding = 16;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.02;

          passes = 3;
          size = 10;
        };

        drop_shadow = true;
        shadow_ignore_window = true;
        shadow_offset = "0 2";
        shadow_range = 20;
        shadow_render_power = 3;
        "col.shadow" = "rgba(00000055)";
      };

      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [

          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"


          #"border, 1, 2, default"
          #"fade, 1, 4, default"
          #"windows, 1, 3, default, popin 80%"
          #"workspaces, 1, 2, default, slide"
        ];
      };

      group = {
        groupbar = {
          font_size = 16;
          gradients = false;
        };

        # "col.border_active" = "rgba(${c.color_accent_primary}88);";
        # "col.border_inactive" = "rgba(${c.color_accent_primary_variant}88)";
      };

      input = {
        kb_layout = "us";

        # focus change on cursor move
        follow_mouse = 1;
        accel_profile = "flat";
        touchpad = {
          scroll_factor = 0.1;
          natural_scroll = true;
        };
      };

      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_is_master = true;
      };

      # touchpad gestures
      gestures = {
        workspace_swipe = true;
        workspace_swipe_forever = true;
      };

      bind = [
        "$mainMod, return, exec, $terminal"
        "$mainMod, space, fullscreen, "
        "$mainMod, tab, cyclenext, "
        "$mainMod SHIFT, tab, cyclenext, prev"

        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, wlogout"
        # "$mainMod, V, togglefloating,"
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mainMod, P, exec, $menu"
        "$mainMod, B, pseudo,"
        "$mainMod, J, togglesplit,"
        "$mainMod, L, exec, swaylock --grace 0"

        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"


        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];

    };
  };

  programs.waybar = {
    enable = true;
  };
}