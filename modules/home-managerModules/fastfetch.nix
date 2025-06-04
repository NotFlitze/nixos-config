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
            keys = "38;2;255;255;255";
            output = "38;2;255;255;255";
          };
          separator = " ➜  ";
        };

        logo = {
          color = {
            "1" = "38;2;255;255;255";
            "2" = "38;2;55;55;55";
          };
        };

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
            format = " ╭──────────────────────────────Software──────────────────────────────╮";
          }
          {
            type = "os";
            key = " │ 󰌽 ";
          }
          {
            type = "kernel";
            key = " │  ";
          }
          {
            type = "bootmgr";
            key = " │ 󰌽 ";
          }
          {
            type = "wm";
            key = " │ 󰍹 ";
          }
          {
            type = "terminal";
            key = " │  ";
          }
          {
            type = "custom";
            format = " ╰────────────────────────────────────────────────────────────────────╯";
          }
          "break"
          {
            type = "custom";
            format = " ╭──────────────────────────────Hardware──────────────────────────────╮";
          }
          {
            type = "cpu";
            format = "{1} {3} {7} {8}";
            temp = true;
            key = " │  ";
          }
          {
            type = "gpu";
            format = "{2} {7} {4}";
            temp = true;
            dedicated-total = true;
#            hideType = if config.networking.hostName == "desktop" then "integrated" else null;     # give Home-Manager the config.networking.hostName thing somehow
            key = " │ 󰢮 ";
          }
          {
            type = "memory";
            key = " │ 󰑭 ";
          }
          {
            type = "board";
            key = " │ [MB] ";
          }
          {
            type = "disk";
            key = " │ 󰋊 ";
          }
          {
            type = "swap";
            key = " │ ⇄ ";
          }
          {
            type = "custom";
            format = " ╰────────────────────────────────────────────────────────────────────╯";
          }
          "break"
          {
            type = "uptime";
            key = "   Uptime   ";
          }
        ];
      };
    };
  };
}

