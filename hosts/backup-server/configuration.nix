#    _             _                                         
#   | |__  __ _ __| |___  _ _ __ ___ ___ ___ _ ___ _____ _ _ 
#   | '_ \/ _` / _| / / || | '_ \___(_-</ -_) '_\ V / -_) '_|
#   |_.__/\__,_\__|_\_\\_,_| .__/   /__/\___|_|  \_/\___|_|  
#                          |_|                               
{
  config,
  pkgs,
  ...
}: {
  imports =
    [
      ./hardware-configuration.nix

      ../../modules/nixosModules/defaults/cli_computer_defaults.nix
      
      ../../modules/nixosModules/defaults/gui_computer_defaults.nix
    ];

  # --- module options --- #

  modules.bootloader.enable = false;
  modules.modrinth-app.enable = false;
  modules.lmstudio.enable = false;
  
  # --- boot --- #
  
  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    useOSProber = true;
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_250GB_S3YJNB0K358813Y";
  };

  # --- host spetific stuff --- #

  networking.hostName = "backup-server";

#  networking.hostId = "generate one";

  networking.firewall.enable = true;

  networking.firewall.allowPing = true;


  # --- user + groups --- #

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  system.stateVersion = "24.11";
}
