{ config, lib, pkgs, ... }:

let
  cfg = config.modules.fastfetch;
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

        modules = [
          "break"
          {
            type = "custom";
            format = " ╭───────────────────────────Software───────────────────────────╮";
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
            type = "wm";
            key = " │ 󰍹 ";
          }
          {
            type = "terminal";
            key = " │  ";
          }
          {
            type = "custom";
            format = " ╰──────────────────────────────────────────────────────────────╯";
          }
          "break"
          {
            type = "custom";
            format = " ╭───────────────────────────Hardware───────────────────────────╮";
          }
          {
            type = "cpu";
            format = "{1} ({3}) {8}";
            temp = true;
            key = " │  ";
          }
          {
            type = "gpu";
            format = "{2} {4}";
            temp = true;              # works on desktop?
#            dedicated-total = true;
#            hideType = if config.networking.hostName == "desktop" then "integrated" else null;     # give Home-Manager the config.networking.hostName thing somehow
            key = " │ 󰢮 ";
          }
          {
            type = "board";
            key = " │  ";
          }
          {
            type = "memory";
            key = " │ 󰑭 ";
            format = "{1} / {2} {4}";
            percent = {
              type = 2;
            };
          }
          {
            type = "disk";
            key = " │ 󰋊 ";
            format = "{1} / {2} {13}";
            percent = {
              type = 2;
            };
          }
          {
            type = "swap";
            key = " │ ⇄ ";
            format = "{1} / {2} {4}";
            percent = {
              type = 2;
            };
          }
          {
            type = "custom";
            format = " ╰──────────────────────────────────────────────────────────────╯";
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

