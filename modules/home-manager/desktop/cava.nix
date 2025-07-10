{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.cava;
in {
  options.modules.cava.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the cava module";
  };

  config = lib.mkIf cfg.enable {
    programs.cava = {
      enable = true;

      settings = {
        general = {
          framerate = 60;
          sleep_timer = 5;
          bar_width = 2;
          bar_spacing = 1;
          overshoot = 1;

          sensitivity = 80;
        };

        smoothing = {
          integral = 30;
          monstercat = 0;
          noise_reduction = 50;
        };

        color = {
          gradient = 1;
          "gradient_color_1" = "'#0F0F0F'";
          "gradient_color_2" = "'#1C1C1C'";
          "gradient_color_3" = "'#2A2A2A'";
          "gradient_color_4" = "'#3A3A3A'";
          "gradient_color_5" = "'#4B4B4B'";
          "gradient_color_6" = "'#6C6C6C'";
          "gradient_color_7" = "'#8D8D8D'";
          "gradient_color_8" = "'#B0B0B0'";
          "gradient_color_9" = "'#D5D5D5'";
          "gradient_color_10" = "'#FFFFFF'";
        };
      };
    };
  };
}
