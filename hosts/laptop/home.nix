#    _           _            
#   | |__ _ _ __| |_ ___ _ __ 
#   | / _` | '_ \  _/ _ \ '_ \
#   |_\__,_| .__/\__\___/ .__/
#          |_|          |_| 

{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-manager/core/_default.nix
      ../../modules/home-manager/desktop/_default.nix
    ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "backup-server" = {
        hostname = "backup-server";
        user = "user";
        identityFile = "~/.ssh/backup-server";
        identitiesOnly = true;
      };
      "server" = {
        hostname = "server";
        user = "user";
        identityFile = "~/.ssh/server";
        identitiesOnly = true;
      };
    };
  };

  # --- testing --- #

  programs.niri.enable = true;

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}