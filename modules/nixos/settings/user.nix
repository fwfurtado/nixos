{ pkgs, ...}:
{

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.mutableUsers = true;

  users.users.me = {
    isNormalUser = true;
    description = "Me";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.nushell;
  };

  users.extraUsers.me = {
    initialHashedPassword = "$y$j9T$/2aI9LryItXxAdZn/U14M1$BD/oO8vSEGV6J2lL0oNNvh.OL1cDi8Nc1ouN0F1mSDA";
  };
}