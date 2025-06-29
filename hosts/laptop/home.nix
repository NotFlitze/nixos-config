#    _           _            
#   | |__ _ _ __| |_ ___ _ __ 
#   | / _` | '_ \  _/ _ \ '_ \
#   |_\__,_| .__/\__\___/ .__/
#          |_|          |_| 

{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-managerModules/hyprland.nix
      ../../modules/home-managerModules/waybar.nix
      ../../modules/home-managerModules/hyprpaper.nix
      ../../modules/home-managerModules/rofi.nix
      ../../modules/home-managerModules/kitty.nix
      ../../modules/home-managerModules/git.nix
      ../../modules/home-managerModules/htop.nix
      ../../modules/home-managerModules/firefox.nix
      ../../modules/home-managerModules/fastfetch.nix
      ../../modules/home-managerModules/vesktop.nix
      ../../modules/home-managerModules/cava.nix
    ];

  home.packages = with pkgs; [
    bibata-cursors
    nerd-fonts.hack
    vscodium
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

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}