#       _        _   _
#    __| |___ __| |_| |_ ___ _ __
#   / _` / -_|_-< / /  _/ _ \ '_ \
#   \__,_\___/__/_\_\\__\___/ .__/
#                           |_|
{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../../modules/nixosModules/core/_default.nix
    ../../modules/nixosModules/desktop/_default.nix
  ];

  # --- module options --- #

  # --- networking --- #

  networking.hostName = "desktop";

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
    extraGroups = ["networkmanager" "wheel"];
  };

  # --- boot --- #

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # --- host spetific stuff --- #

  environment.systemPackages = with pkgs; [ linuxKernel.packages.linux_6_12.r8125 ];      # check if you still need that 

  # --- #

   services.displayManager.sessionPackages = [ pkgs.niri ];     # adds niri to the gdm display manager

  system.stateVersion = "25.05";
}
