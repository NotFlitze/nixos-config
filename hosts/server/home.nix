#    ___ ___ _ ___ _____ _ _
#   (_-</ -_) '_\ V / -_) '_|
#   /__/\___|_|  \_/\___|_|
#

{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-manager/core/_default.nix
      ../../modules/home-manager/server/_default.nix
    ];

  programs.ssh = {
    enable = true;
    matchBlocks = {
      "backup-server" = {
        hostname = "backup-server";
        user = "root";
        identityFile = "~/.ssh/backup-server";
        identitiesOnly = true;
      };
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}