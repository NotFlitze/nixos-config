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
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixosModules/defaults/cli_computer_defaults.nix
  ];

  # --- module options --- #

  modules.bootloader.enable = false; # fix

  # --- boot --- #

  boot.loader.grub = {
    enable = true;
    efiSupport = false;
    useOSProber = true;
    device = "/dev/disk/by-id/ata-Samsung_SSD_860_EVO_250GB_S3YJNB0K358813Y";
  };

  boot = {
    supportedFilesystems = ["zfs"];
    zfs = {
      forceImportRoot = false;
      extraPools = ["backup"];
    };
  };

  # --- networking --- #

  networking.hostName = "backup-server";

  networking.hostId = "feef2b19";

  networking.firewall.enable = true;

  networking.firewall.allowPing = true;

  # --- ssh --- #

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
    };
  };

  users.users."user".openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHVFK4CONQnfkGHlL2PjylknlgE54anLeqlOZvXn3g27 user@server"          # from server
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO8y5HzRXz4sUFmgcrMI3cbBlYQJmwPI3/5mAPTWi0Fv user@desktop"         # from desktop
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOZ1CpP7Rc1kkuOnOUhbMGdEVs9xEeuxC5CnIaHPaID user@laptop"          # from laptop
  ];

  # --- user + groups --- #

  users.users.user = {
    isNormalUser = true;
    extraGroups = ["networkmanager" "wheel"];
  };

  system.stateVersion = "24.11";
}
