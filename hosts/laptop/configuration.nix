#    _           _            
#   | |__ _ _ __| |_ ___ _ __ 
#   | / _` | '_ \  _/ _ \ '_ \
#   |_\__,_| .__/\__\___/ .__/
#          |_|          |_| 

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix

      ../../modules/nixosModules/defaults/gui_computer_defaults.nix
  ];

  networking = {
    hostName = "laptop";
  };

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  # --- ssh --- #

    services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users."user".openssh.authorizedKeys.keys = [
    ""
  ];

  system.stateVersion = "24.11";
}
