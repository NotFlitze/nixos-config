#       _        _   _            
#    __| |___ __| |_| |_ ___ _ __ 
#   / _` / -_|_-< / /  _/ _ \ '_ \
#   \__,_\___/__/_\_\\__\___/ .__/
#                           |_|
   
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

#      ../../modules/home-managerModules/btop.nix
#      ../../modules/home-managerModules/vscode.nix
    ];

  home.packages = with pkgs; [
    hyprpaper
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

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}