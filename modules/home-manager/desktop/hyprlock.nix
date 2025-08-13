{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.hyprlock;
in {
  options.modules.hyprlock.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the hyprlock module";
  };

  config = lib.mkIf cfg.enable {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = false;
          grace = false;
          hide_cursor = true;
          no_fade_in = false;
        };

        background = [
          {
            path = "/etc/nixos/wallpapers/wallpaper1.jpg";
            blur_passes = 2;
            blur_size = 1;
          }
        ];

        input-field = [
          {
            size = "200, 40";
            position = "0, 0";
            monitor = "DP-1";
            outer_color = "rgba(255,255,255,1.0)";
            inner_color = "rgba(0,0,0,1.0)";
            outline_thickness = 3;
            rounding = 7;
            font_color = "rgba(255,255,255,1.0)";
            dots_center = true;
            fade_on_empty = false;
            placeholder_text = "";
          }
        ];

        label = [
          {
            position = "0, 51";
            halign = "center";
            valign = "center";
            monitor = "DP-1";
            color = "rgba(255,255,255,1.0)";
            text = "$TIME";
            font_family = "FiraCode Nerd Font";
            font_size = 18;
          }
        ];

        shape = [
          {
            size = "200, 40";
            position = "0, 51";
            halign = "center";
            valign = "center";
            monitor = "DP-1";
            color = "rgba(0,0,0,1.0)";
            border_color = "rgba(255,255,255,1.0)";
            border_size = 3;
            rounding = 7;
          }
        ];
      };
    };
  };
}