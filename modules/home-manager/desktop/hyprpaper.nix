{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprpaper;
in
{
  options.modules.hyprpaper.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the hyprpaper module";
  };

  config = lib.mkIf cfg.enable {

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
    source = ../../../wallpapers;
    recursive = true;
  };
  
  };
}