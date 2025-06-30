#    _           _
#   | |__ _ _ __| |_ ___ _ __
#   | / _` | '_ \  _/ _ \ '_ \
#   |_\__,_| .__/\__\___/ .__/
#          |_|          |_|
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixosModules/defaults/gui_computer_defaults.nix
  ];

  # --- module options --- #

  modules.trackpad.enable = true;
  
  modules.fprintd.enable = true;

  # --- networking --- #

  networking.hostName = "laptop";

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

  # --- user + groups --- #

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["wheel" "networkmanager"];
  };

  # --- boot --- #

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- #

  system.stateVersion = "24.11";
}
