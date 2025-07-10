{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.kitty;
in {
  options.modules.kitty.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the kitty module";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "Hack Nerd Font";
        size = 10;
      };
      settings = {
        background_opacity = "0.8";
        wheel_scroll_min_lines = 1;
        window_padding_width = 4;
        confirm_os_window_close = 0;
#        scrollback_lines = 10000;
        enable_audio_bell = false;
        mouse_hide_wait = 5;
#        cursor_trail = 1;
#        tab_fade = 1;
#        active_tab_font_style = "bold";
#        inactive_tab_font_style = "bold";
#        tab_bar_edge = "top";
#        tab_bar_margin_width = 0;
#        tab_bar_style = "powerline";
#        tab_bar_style = "fade";
#        enabled_layouts = "splits";
      };
    };
  };
}
