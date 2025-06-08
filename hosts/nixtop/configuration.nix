#         _     _            
#    _ _ (_)_ _| |_ ___ _ __ 
#   | ' \| \ \ /  _/ _ \ '_ \
#   |_||_|_/_\_\\__\___/ .__/
#                      |_|

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
      ./hardware-configuration.nix

      ../../modules/nixosModules/defaults/gui_computer_defaults.nix
  ];

  networking = {
    hostName = "nixtop";
  };

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  environment.systemPackages = with pkgs; [
    openjdk17
  ];


  system.stateVersion = "24.11";
}
