#       _        _   _
#    __| |___ __| |_| |_ ___ _ __
#   / _` / -_|_-< / /  _/ _ \ '_ \
#   \__,_\___/__/_\_\\__\___/ .__/
#                           |_|
{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../../modules/nixos/core/_default.nix
    ../../modules/nixos/desktop/_default.nix

    ./boot.nix
    ./module_toggle.nix
    ./networking.nix
    ./ssh.nix
    ./user+groups.nix
    ./kernel_packages.nix
  ];

  # test stuff

  environment.systemPackages = [
    inputs.swww.packages.${pkgs.system}.swww
    pkgs.xwayland-satellite
  ];

  security.pam.services.hyprlock = {};

  services.displayManager.sessionPackages = [pkgs.niri]; # adds niri to the gdm display manager

  system.stateVersion = "25.05";
}
