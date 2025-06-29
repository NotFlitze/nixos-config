#    ___ ___ _ ___ _____ _ _
#   (_-</ -_) '_\ V / -_) '_|
#   /__/\___|_|  \_/\___|_|
#

{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-managerModules/git.nix
      ../../modules/home-managerModules/htop.nix
      ../../modules/home-managerModules/fastfetch.nix
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
    };
  };

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}