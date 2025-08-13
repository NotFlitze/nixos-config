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
    ../../modules/nixos/core/_default.nix
    ../../modules/nixos/desktop/_default.nix

    ./boot.nix
    ./module_toggle.nix
    ./networking.nix
    ./ssh.nix
    ./user+groups.nix
  ];

  # test stuff

  environment.systemPackages = [
    inputs.swww.packages.${pkgs.system}.swww
    pkgs.xwayland-satellite
  ];

  security.pam.services.hyprlock = {};

  services.displayManager.sessionPackages = [pkgs.niri]; # adds niri to the gdm display manager

  system.stateVersion = "24.11";
}
