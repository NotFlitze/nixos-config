#       _        _   _            
#    __| |___ __| |_| |_ ___ _ __ 
#   / _` / -_|_-< / /  _/ _ \ '_ \
#   \__,_\___/__/_\_\\__\___/ .__/
#                           |_|   

{ config, pkgs, ... }:

{
  imports = # check for home-manager config for these programs
    [
      ./hardware-configuration.nix

      ../../modules/nixosModules/defaults/gui_computer_defaults.nix

      ../../modules/nixosModules/packages/drivers/_drivers-default.nix
    ];

  modules.trackpad.enable = false;

#  modules.libreoffice-still.enable = false;

  networking.hostName = "desktop";

  users.users.user = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  system.stateVersion = "25.05";

}