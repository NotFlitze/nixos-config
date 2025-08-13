{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.rofi;
in {
  options.modules.rofi.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the rofi module";
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      extraConfig = {
        modi = "drun,filebrowser,run";
        show-icons = true;
        # icon-theme = "Papirus";
        font = "Fira Code Nerd Font 12";
        drun-display-format = "{name}";
        display-drun = "Programs";
        display-run = "Run";
        display-filebrowser = "File";
      };
      theme = let
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        "*" = {
          # bg = mkLiteral "#000000";                   # create proper ones
          # bg-alt = mkLiteral "#E7E7E7";
          # foreground = mkLiteral "#2994A0";
          # selected = mkLiteral "#8E8E8E";
          # active = mkLiteral "#9A29A0";
          # text-selected = mkLiteral "#000000";
          # text-color = mkLiteral "#FFFFFF";
          # border-color = mkLiteral "#FFFFFF";
          # urgent = mkLiteral "#A06B29";
        };

        "window" = {
          transparency = "real";
          width = mkLiteral "700px";
          location = mkLiteral "center";
          anchor = mkLiteral "center";
          fullscreen = false;
          x-offset = mkLiteral "0px";
          y-offset = mkLiteral "0px";
          cursor = "default";
          enabled = true;
          background-color = mkLiteral "transparent";

          padding = mkLiteral "20px";
          border = mkLiteral "3px";
          border-color = mkLiteral "#FF0000";
          border-radius = mkLiteral "3px";
        };

        "mainbox" = {
          enabled = true;
          spacing = mkLiteral "5px";
          orientation = mkLiteral "vertical";
          children = map mkLiteral [
            "inputbar"
            "listbox"
            "mode-switcher"
          ];
          background-color = mkLiteral "transparent";
        };

        "inputbar" = {
          enabled = true;
          spacing = mkLiteral "5px";
          padding = mkLiteral "3px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "#FFFFFF";
          children = map mkLiteral [
            "entry"
          ];
        };

        "entry" = {
          enabled = true;
          background-color = mkLiteral "#000000";
          text-color = mkLiteral "#FFFFFF";
          cursor = mkLiteral "text";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "3px";
        };

        "listbox" = {
          spacing = mkLiteral "0px";
          padding = mkLiteral "3px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "#FFFFFF";
          orientation = mkLiteral "vertical";
          children = map mkLiteral [
            "message"
            "listview"
          ];
        };

        "listview" = {
          enabled = true;
          columns = 1;
          lines = 5;
          cycle = false;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;
          spacing = mkLiteral "0px";
          border-radius = mkLiteral "5px";
          background-color = mkLiteral "#000000";
          text-color = mkLiteral "#FFFFFF";
          cursor = "default";
        };

        "mode-switcher" = {
          enabled = true;
          spacing = mkLiteral "3px";
          padding = mkLiteral "3px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "#FFFFFF";
        };

        "button" = {
          padding = mkLiteral "5px";
          border-radius = mkLiteral "5px";
          background-color = mkLiteral "#000000";
          text-color = mkLiteral "#FFFFFF";
          cursor = mkLiteral "pointer";
        };

        "button selected" = {
          background-color = mkLiteral "#8E8E8E";
          text-color = mkLiteral "#000000";
        };

        "element" = {
          enabled = true;
          spacing = mkLiteral "5px";
          padding = mkLiteral "5px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#FFFFFF";
          cursor = mkLiteral "pointer";
        };

        "element normal.normal" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "#FFFFFF";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "0px";
        };

        "element normal.urgent" = {
          background-color = mkLiteral "#FF2D2D";
          text-color = mkLiteral "#FFFFFF";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "0px";
        };

        "element normal.active" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "#FFFFFF";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "0px";
        };

        "element selected.normal" = {
          background-color = mkLiteral "#8E8E8E";
          text-color = mkLiteral "#000000";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "0px";
        };

        "element selected.urgent" = {
          background-color = mkLiteral "#FF2D2D";
          text-color = mkLiteral "#000000";
          border-radius = mkLiteral "5px";
          padding = mkLiteral "0px";
        };

        "element selected.active" = {
          background-color = mkLiteral "#FF2D2D";
          text-color = mkLiteral "#000000";
          border-radius = mkLiteral "0px";
          padding = mkLiteral "0px";
        };

        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "36px";
          cursor = mkLiteral "inherit";
        };

        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        "message" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "#FFFFFF";
        };

        "textbox" = {
          padding = mkLiteral "5px";
          border-radius = mkLiteral "7px";
          background-color = mkLiteral "#000000";
          text-color = mkLiteral "#FFFFFF";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };

        "error-message" = {
          padding = mkLiteral "5px";
          background-color = mkLiteral "#000000";
          text-color = mkLiteral "#8E8E8E";
        };
      };
    };
  };
}
