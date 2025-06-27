{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the hyprland module";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        general = {
          "$modifier" = "SUPER";
          layout = "dwindle";
          gaps_in = 3;
          gaps_out = 5;
          border_size = 3;
          resize_on_border = true;
        };

        monitor = "eDP-1,1920x1080@60,0x0,1";

        env = [
          "XCURSOR_THEME, Bibata-Modern-Classic"
          # "HYPRCURSOR_THEME, Bibata-Modern-Classic"
          "XCURSOR_SIZE, 10"
          # "HYPRCURSOR_SIZE, 10"
        ];

        input = {
          kb_layout = "de";
        };

        bind = [
          "$modifier,K,exec,kitty"
          "$modifier,SPACE,exec,rofi -show drun"
          "$modifier,Q,killactive"

          "$modifier CONTROL,left,resizeactive,-20 0"
          "$modifier CONTROL,right,resizeactive,20 0"
          "$modifier CONTROL,up,resizeactive,0 -20"
          "$modifier CONTROL,down,resizeactive,0 20"

          "$modifier ALT,left,movefocus,l"
          "$modifier ALT,right,movefocus,r"
          "$modifier ALT,up,movefocus,u"
          "$modifier ALT,down,movefocus,d"

          "$modifier,left,swapwindow,l"
          "$modifier,right,swapwindow,r"
          "$modifier,up,swapwindow,u"
          "$modifier,down,swapwindow,d"

          "$modifier,1,workspace,1"
          "$modifier,2,workspace,2"
          "$modifier,3,workspace,3"
          "$modifier,4,workspace,4"
          "$modifier,5,workspace,5"
          "$modifier,6,workspace,6"
          "$modifier,7,workspace,7"
          "$modifier,8,workspace,8"
          "$modifier,9,workspace,9"
          "$modifier,0,workspace,10"

          "$modifier,F,togglefloating"
          ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
          ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
          ",XF86AudioMute,exec,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ",XF86AudioPlay,exec,playerctl play-pause"
          ",XF86AudioPause,exec,playerctl play-pause"
          ",XF86AudioNext,exec,playerctl next"
          ",XF86AudioPrev,exec,playerctl previous"
          ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
          ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
        ];
        
        bindm = [
          "$modifier,mouse:272,movewindow"
          "$modifier,mouse:273,resizewindow"
        ];

        exec-once = [
          "waybar"
          "hyprpaper --config ~/.config/hypr/hyprpaper.conf"
        ];
      }; 

      extraConfig = ''
        source = ~/.config/hypr/monitors.conf 
      '';                                                   # managed with nwg-displays
    };
  };
}
