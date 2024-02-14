# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.default
    ];
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.consoleMode = "auto";

  networking.hostName = "rabbit-hole"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "altgr-intl";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.sudo.extraRules= [
  {  users = [ "me" ];
    commands = [
       { command = "ALL" ;
         options= [ "NOPASSWD" ]; # "SETENV" # Adding the following could be a good idea
      }
    ];
  }
];
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.me = {
    isNormalUser = true;
    description = "Me";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
    packages = with pkgs; [
    #  firefox
    #  thunderbird
    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    useGlobalPkgs = true;
    users = {
      "me" = import ./home.nix;
    };

  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (_: true);

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    neovim
    keyd
    git
    gnomeExtensions.appindicator
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

  # Udev
  services.udev.packages = with pkgs; [
    gnome.gnome-settings-daemon
  ];


  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland = {
        enable = true;
      };
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  services.keyd = {
    enable = true;
    keyboards.default = {
      ids = [
        "0001:0001"
      ];

      settings = {
          main = {
            "q" = "q";
            "w" = "w";
            "e" = "f";
            "r" = "p";
            "t" = "b";
            "y" = "j";
            "u" = "l";
            "i" = "u";
            "o" = "y";
            "p" = ";";
            "[" = "[";
            "]" = "]";

            "a" = "overloadt(meta, a, 300)";
            "s" = "overloadt(alt, r, 300)";
            "d" = "overloadt(control, s, 300)";
            "f" = "overloadt(shift, t, 300)";
            "g" = "g";
            "h" = "m";
            "j" = "overloadt(shift,n,300)";
            "k" = "overloadt(control,e,300)";
            "l" = "overloadt(alt,i,300)";
            ";" = "overloadt(meta,o,500)";
            "'" = "'";
            # "\" = "\";

            "z" = "z";
            "x" = "overloadt(altgr,x,300)";
            "c" = "c";
            "v" = "d";
            "b" = "v";
            "n" = "k";
            "m" = "h";
            "," = ",";
            "." = "overloadt(altgr,.,300)";
            "/" = "/";

            "leftalt" = "overloadt(nav, tab, 300)";
            "leftmeta" = "esc";
            "rightalt" = "overloadt(numbers,backspace,300)";
            "ro" = "overloadt(functions, delete, 300)";
          };

          nav = {
            "j" = "left";
            "k" = "down";
            "l" = "up";
            ";" = "right";
            "m" = "home";
            "," = "pageup";
            "." = "pagedown";
            "/" = "end";
            "u" = "macro(C-v)";
            "i" = "macro(C-c)";
            "o" = "macro(C-x)";
            "p" = "macro(C-z)";
          };

          numbers = {
            "q" = "[";
            "w" = "7";
            "e" = "8";
            "r" = "9";
            "t" = "]";
            "a" = ";";
            "s" = "4";
            "d" = "5";
            "f" = "6";
            "g" = "equal";
            "z" = "`";
            "x" = "1";
            "c" = "2";
            "v" = "3";
            # "b" = "\";
            "leftmeta" = ".";
            "leftalt" = "0";
          };

          "numbers+shift" = {
            "leftmeta" = "(";
            "space" = "minus";
          };

          functions = {
            "q" = "f12";
            "w" = "f7";
            "e" = "f8";
            "r" = "f9";
            "t" = "sysrq";
            "a" = "f11";
            "s" = "f4";
            "d" = "f5";
            "f" = "f6";
            "z" = "f10";
            "x" = "f1";
            "c" = "f2";
            "v" = "f3";
          };
      };
    };
  };

  fonts.fontconfig.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    nerdfonts
    comic-mono
  ];

}
