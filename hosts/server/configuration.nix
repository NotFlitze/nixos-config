#                            
#    ___ ___ _ ___ _____ _ _ 
#   (_-</ -_) '_\ V / -_) '_|
#   /__/\___|_|  \_/\___|_|  
#                           

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

  networking.hostId = "f6b91edc";

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  boot = {
    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      extraPools = ["nasdata"];
    };
  
    loader.grub = {
      zfsSupport = true;
    };
  };

  system.stateVersion = "25.05";

}
