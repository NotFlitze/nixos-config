{ config, lib, pkgs, ... }:

let
  cfg = config.modules.cava;
in
{
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
          bars = 80;
          autosens = 1;
          sensitivity = 100;
          lower_cutoff_freq = 50;
          higher_cutoff_freq = 10000;
          sleep_timer = 5;
          mono = false;
          reverse = false;
          bar_width = 2;
          bar_spacing = 1;
          overshoot = 20;
        };

        input = {
          method = "pulseaudio";
          source = "@DEFAULT_SOURCE@";
          sample_rate = 44100;
          channels = "stereo";
        };

        color = {
          foreground = "'#00FF00'";
          background = "'#000000'";
          gradient = true;
          gradient_color_1 = "'#FF0000'";
          gradient_color_2 = "'#FFFF00'";
          gradient_color_3 = "'#00FF00'";
          overshoot = "'#FFFFFF'";
          fallback = false;
        };

        smoothing = {
          integral = 90;
          monstercat = true;
          waves = false;
          noise_reduction = 80;
        };

        output = {
          method = "ncurses";
          raw_target = "/tmp/cava.raw";
          data_format = "ascii";
          channels = "stereo";
        };

        eq = {
          1 = 1.0;
          2 = 1.2;
          3 = 1.0;
          4 = 0.8;
          5 = 1.1;
          6 = 1.0;
          7 = 1.0;
          8 = 1.0;
          9 = 1.0;
          10 = 1.0;
        };
      };
    };
  };
}