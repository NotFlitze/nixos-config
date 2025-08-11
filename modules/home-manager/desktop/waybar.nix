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
      settings = [
        {
          layer = "top";
          position = "top";
          reload_style_on_change = true;
          height = 20;
          spacing = 0;
          margin-top = 0;
          margin-bottom = 0;
          margin-left = 0;
          margin-right = 0;

          modules-center = ["clock"];
          modules-right = ["gpu" "cpu" "memory" "pulseaudio" "backlight" "battery""network"];
          modules-left = ["niri/workspaces"];

          "clock" = {
            format = ''{:L%I:%M %p}'';
            tooltip = true;
            tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
          };

          "memory" = {
            interval = 5;
            format = "󰑭  {}%";
            tooltip = false;
            on-click = "kitty -e btop";
          };
          
          "cpu" = {
            interval = 5;
            format = "  {usage:2}%";
            tooltip = false;
            on-click = "kitty -e btop";
          };

          "network" = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format-ethernet = " {bandwidthDownOctets}";
            format-wifi = "{icon} {signalStrength}%";
            format-disconnected = "󰤮";
            tooltip = false;
            on-click = "kitty -e nmtui";
          };

          "pulseaudio" = {
            format = "{icon} {volume}% {format_source}";
            format-bluetooth = "{volume}% {icon} {format_source}";
            format-bluetooth-muted = " {icon} {format_source}";
            format-muted = " {format_source}";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = [
                ""
                ""
                ""
              ];
            };
            on-click = "blueman-manager";
          };
        }
      ];
    };
  };
}
