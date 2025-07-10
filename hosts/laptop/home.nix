#    _           _            
#   | |__ _ _ __| |_ ___ _ __ 
#   | / _` | '_ \  _/ _ \ '_ \
#   |_\__,_| .__/\__\___/ .__/
#          |_|          |_| 

{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../modules/home-manager/hyprland.nix
      ../../modules/home-manager/waybar.nix
      ../../modules/home-manager/hyprpaper.nix
      ../../modules/home-manager/rofi.nix
      ../../modules/home-manager/kitty.nix
      ../../modules/home-manager/git.nix
      ../../modules/home-manager/htop.nix
      ../../modules/home-manager/firefox.nix
      ../../modules/home-manager/fastfetch.nix
      ../../modules/home-manager/vesktop.nix
      ../../modules/home-manager/cava.nix
      ../../modules/home-manager/alacritty.nix

#      ../../modules/home-manager/stylix.nix
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

  programs.niri.enable = true;

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}