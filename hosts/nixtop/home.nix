{
  config,
  pkgs,
  inputs,
  lib,
  ...
}: {

  home.packages = with pkgs; [
    cmatrix
    htop
    rofi-wayland
    waybar
    wl-clipboard
    hyprpaper
    bibata-cursors
    hyprcursor
    nerd-fonts.hack
    vesktop
    vscodium
    grim # do something
#    cowsay
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = "eDP-1,1920x1080@60,0x0,1";

      env = [
        "XCURSOR_THEME, Bibata-Modern-Classic"
        #        "HYPRCURSOR_THEME, Bibata-Modern-Classic ´"
        "XCURSOR_SIZE, 10"
        #        "HYPRCURSOR_SIZE, 10"
      ];

      input = {
        kb_layout = "de";
      };

      bind = [
        "SUPER, K, exec, kitty"
        "SUPER, F, exec, firefox"
        "SUPER, SPACE, exec, rofi -show drun"
        "SUPER_SHIFT, Q, killactive"
      ];

      exec-once = [
        "waybar"
        "hyprpaper --config ~/.config/hypr/hyprpaper.conf"
      ];
    };
  };

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        modules-center = ["clock"];
      };
    };
  };

  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on"; # for controlling with external commands
#      splash = false; # "fade in"
#      splash_offset = 2.0;
      preload = ["~/.config/hypr/wallpapers/wallpaper1.jpg"];

      wallpaper = [",~/.config/hypr/wallpapers/wallpaper1.jpg"];
    };
  };
  home.file.".config/hypr/wallpapers" = {
    source = ./wallpapers;
    recursive = true;
  };

  programs.kitty = {
    enable = true;
    font = {
      name = "Hack Nerd Font";
      size = 10;
    };
    settings = {
    };
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
