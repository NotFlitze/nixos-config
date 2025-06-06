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

#      ../../modules/home-managerModules/btop.nix
#      ../../modules/home-managerModules/vscode.nix
    ];

  home.packages = with pkgs; [
    hyprpaper
    bibata-cursors
    nerd-fonts.hack
    vesktop
    vscodium
  ];

  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}