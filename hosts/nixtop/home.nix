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
#      ../../modules/home-managerModules/btop.nix
#      ../../modules/home-managerModules/vscode.nix
    ];

  home.packages = with pkgs; [
    bibata-cursors
    nerd-fonts.hack
    vesktop
    vscodium
  ];

#  fonts.fontconfig.enable = true;                        # use once you want a system wide font

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
