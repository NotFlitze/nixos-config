{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.waybar;
in {
  options.modules.waybar.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the waybar module";
  };

  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings.mainBar = {
          layer = "bottom";
          output = "DP-1";
          position = "top";
          reload_style_on_change = true;
          height = 32;
          spacing = 5;
          margin-top = 5;
          margin-bottom = 0;
          margin-left = 5;
          margin-right = 5;

          modules-center = ["clock"];
          modules-right = ["cpu" "memory" "pulseaudio" "backlight" "network" "battery"]; # create a gpu thingy
          modules-left = ["niri/workspaces"];

          "clock" = {
            format = ''{:%I:%M %p}'';
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
          };

          "memory" = {
            interval = 5;
            format = "  {}%";
            tooltip = false;
            on-click = "kitty -e btop";
          };

          "cpu" = {
            interval = 5;
            format = " {usage:2}%";
            tooltip = false;
            on-click = "kitty -e btop";
          };

          "network" = {
            format = "{icon}  {bandwidthDownBits}  {bandwidthUpBits}";
            format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
            format-ethernet = "󰈁  {bandwidthDownBits}  {bandwidthUpBits}";
            format-wifi = "{icon}  {bandwidthDownBits}  {bandwidthUpBits}";
            format-disconnected = "󰈂";
            tooltip = false;
            on-click = "kitty -e nmtui";
          };

          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = "  t{icon} {format_source}";
            format-muted = "  {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = " ";
              hands-free = " ";
              headset = " ";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                " "
              ];
            };
            tooltip = false;
            on-click = "blueman-manager";
          };

          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "{icon} {capacity}%";
            format-charging = "󰂄 {capacity}%";
            format-plugged = "󱘖 {capacity}%";
            format-icons = [
              "󰁺"
              "󰁻"
              "󰁼"
              "󰁽"
              "󰁾"
              "󰁿"
              "󰂀"
              "󰂁"
              "󰂂"
              "󰁹"
            ];
            tooltip = false;
          };
        };

      style = ''
        * {
        border: none;
          font-family: "Fira Code Nerd Font";
          font-size: 14px;
          font-weight: bold;
          min-height: 0;
        }

        window#waybar {
          background: rgba(0,0,0,0);
        }

        #workspaces {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
        }

        #workspaces button {
          background: #000000;
          color: #FFFFFF;
          border-radius: 4px;
        }

        #workspaces button.active {
          color: #000000;
          background: #8E8E8E;
          border-radius: 4px;
        }

        /* #workspaces button:hover {

        } */

        #clock {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }

        #cpu {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }

        #memory {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }

        #pulseaudio {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }

        #backlight {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }

        #network {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }

        #battery {
          border: 3px solid #FFFFFF;
          border-radius: 7px;
          background: #000000;
          color: #FFFFFF;
          padding: 0px 6px 0px 6px;
        }
        
      '';
    };
  };
}
