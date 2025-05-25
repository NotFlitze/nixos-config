{ config, pkgs, inputs, lib, ... }: 

  {
    imports =
    [
      ../../home-managerModules/hyprland.nix
      ../../home-managerModules/waybar.nix
      ../../home-managerModules/hyprpaper.nix
      ../../home-managerModules/rofi.nix
      ../../home-managerModules/kitty.nix
      ../../home-managerModules/git.nix
#      ../../nixosModules/htop.nix
#      ../../home-managerModules/btop.nix
#      ../../home-managerModules/vscode.nix
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
