#         _     _            
#    _ _ (_)_ _| |_ ___ _ __ 
#   | ' \| \ \ /  _/ _ \ '_ \
#   |_||_|_/_\_\\__\___/ .__/
#                      |_|

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];


  services = {
    libinput.enable = true; # touchpad
  };

#  fonts.packages = with pkgs; [
#    noto-fonts
#    noto-fonts-emoji
#  ];

#  services.xserver.enable = true;

  networking = {
    hostName = "nixtop";
    firewall.allowedTCPPorts = [22];
  };
  

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  services.fprintd.enable = true;
  services.fprintd.tod.enable = true;
  services.fprintd.tod.driver = pkgs.libfprint-2-tod1-broadcom;

  services.dbus.enable = true;
  programs.dconf.enable = true;

  system.stateVersion = "24.11"; # Don't change that do research !!!
}
