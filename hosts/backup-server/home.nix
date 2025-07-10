#    _             _
#   | |__  __ _ __| |___  _ _ __ ___ ___ ___ _ ___ _____ _ _
#   | '_ \/ _` / _| / / || | '_ \___(_-</ -_) '_\ V / -_) '_|
#   |_.__/\__,_\__|_\_\\_,_| .__/   /__/\___|_|  \_/\___|_|
#                          |_|
{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-manager/core/_default.nix
      ../../modules/home-manager/server/_default.nix
    ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}