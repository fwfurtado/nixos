{lib, config, ...}:

with lib;
let
  cfg = config.services.networking;
  targets = ["laptop" "desktop" "server"];
  defaultConfigs = {
    hostname = {
      laptop = "rabbit-hole";
      desktop = "mad-hatter";
      server = "wonderland";
    };
  };
in {

  options.services.target = mkOption {
      type = types.enum targets;
  };

  config = {
    networking = {
      hostName = defaultConfigs.hostname.${cfg.target}; # Define your hostname.
      networkmanager.enable = true;
    };
  };
}