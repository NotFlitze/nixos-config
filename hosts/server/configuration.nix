{ config, pkgs, ... }:

{
  imports = # check for home-manager config for these programs
    [
      ./hardware-configuration.nix

      
      ../../modules/nixosModules/defaults/cli_computer_defaults.nix 
     
      ../../modules/nixosModules/system/core/bootloader_grub.nix

    ];

  modules.bootloader.enable = false;

  networking.hostName = "server";

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "25.05";

}
