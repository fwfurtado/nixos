
{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wezterm
  ];

  programs.wezterm = {
    enable = true;
    extraConfig = ''
    local wezterm = require 'wezterm'
    local mux = wezterm.mux

    local config = {}

    if wezterm.config_builder then
      config = wezterm.config_builder()
    end


    config.color_scheme = 'Catppuccin Mocha (Gogh)'
    config.window_background_opacity = 0.85

    config.keys = {
      {
        key = 'n',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
      },
      {
        key = 'e',
        mods = 'CTRL|SHIFT|ALT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
      }
    }

    config.unix_domains = {
      {
        name = "mimi"
      }
    }

    return config
    '';
  };
}