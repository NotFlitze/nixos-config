{ config, lib, pkgs, ... }:

let
  cfg = config.modules.fastfetch;
#  hostname = "desktop";
in {
  options.modules.fastfetch.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the fastfetch module";
  };

  config = lib.mkIf cfg.enable {
    programs.fastfetch = {
      enable = true;

      settings = {
        display = {
          color = {
            keys = "1";
            output = "1";
          };
          separator = " ➜  ";
        };

        logo = {
          color = {
            "1" = "38;2;255;255;255";
            "2" = "38;2;55;55;55";
          };
        };

        # Beispiel für Bildlogo – auskommentiert
        # {
        #   source = ./nixos.png;
        #   type = "kitty-direct";
        #   "nixos";
        #   height = 10;
        #   width = 20;
        #   padding = {
        #     top = 2;
        #     left = 2;
        #   };
        # };

        modules = [
          "break"
          {
            type = "custom";
            format = " ╭─────────────────────────────────────────────────────────────────────╮";
            separator = "";
            keyColor = "1";
          }
          {
            type = "os";
            key = "OS   ";
            keyColor = "1";
          }
          {
            type = "kernel";
            key = " ├  ";
            keyColor = "1";
          }
          {
            type = "custom";
            format = " │";
            keyColor = "1";
          }
          {
            type = "wm";
            key = "WM   ";
            keyColor = "1";
          }
          {
            type = "terminal";
            key = " ├  ";
            keyColor = "1";
          }
          "break"
          {
            type = "cpu";
            temp = true;
            key = " ├  ";
            keyColor = "1";
          }
          {
            type = "gpu";
            format = "{4} {2}  {7}";
            temp = true;
#            hideType = if config.networking.hostName == "desktop" then "integrated" else null;     # give Home-Manager the config.networking.hostName thing somehow
            key = " ├ 󰢮 ";
            keyColor = "1";
          }
          {
            type = "memory";
            key = " ├ 󰑭";
            keyColor = "1";
          }
          {
            type = "board";
            key = " ├ ";
            keyColor = "1";
          }
          {
            type = "disk";
            key = " ├ 󰋊";
            keyColor = "1";
          }
          "break"
          {
            type = "uptime";
            key = "   Uptime   ";
          }
          {
            type = "custom";
            format = " ╰───────────────────────────╯";
            keyColor = "1";
          }
        ];
      };
    };
  };
}

