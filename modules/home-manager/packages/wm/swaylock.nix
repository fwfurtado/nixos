{pkgs, ... }:
{
 programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
      font-size = 20;
      fade-in = 0.5;
      grace = 5;
      indicator-radius = 100;
      screenshots = true;
      effect-blur = "10x10";
    };
  };

}