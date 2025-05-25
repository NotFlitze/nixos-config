{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the hyprland module";
  };

  config = lib.mkIf cfg.enable {
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
  };
}