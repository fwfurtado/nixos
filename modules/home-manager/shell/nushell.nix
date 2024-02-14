{ config, pkgs, ... }:

let
  aliases = import ./aliases {};
in {

  home.packages = with pkgs; [
    nushell
  ];


  programs = {
    nushell = {
      enable = true;

      shellAliases = aliases.user.aliases;

      extraConfig = ''
      $env.config = {
        show_banner: false
      }

      source ${config.xdg.cacheHome}/nushell/completions/gnumake.nu
      '';
    };

    carapace.enableNushellIntegration = true;
    direnv.enableNushellIntegration = true;
    # mise.enableNushellIntegration = true;
    starship.enableNushellIntegration = true;
    zoxide.enableNushellIntegration = true;
  };

  home.file = {
    "${config.xdg.cacheHome}/nushell/completions/gnumake.nu".source = ./assets/nushell/completions/gnumake.nu;
  };
}