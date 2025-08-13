{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.wlogout;
in {
  options.modules.wlogout.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the wlogout module";
  };

  config = lib.mkIf cfg.enable {
    programs.wlogout = {
      enable = true;
      layout = [
      {
        "label" = "lock";
        "action" = "hyprlock";
        "text" = "Lock";
        "keybind" = "l";
      }
      {
        "label" = "logout";
        "action" = "niri msg action quit";
        "text" = "Exit";
        "keybind" = "e";
      }
      {
        "label" = "reboot";
        "action" = "systemctl reboot";
        "text" = "Reboot";
        "keybind" = "r";
      }
      {
        "label" = "suspend";
        "action" = "systemctl suspend";
        "text" = "Suspend";
        "keybind" = "u";
      }
      {
        "label" = "shutdown";
        "action" = "systemctl poweroff";
        "text" = "Shutdown";
        "keybind" = "s";
      }
      {
        "label" = "hibernate";
        "action" = "systemctl hibernate";
        "text" = "Hibernate";
        "keybind" = "h";
      }
    ];

    style = ''
      * {
        background-image: none;
        font-family: "Fira Code Nerd Font";
      	background-image: none;
      	transition: 0ms;
      }

      window {
      	background-color: rgba(0, 0, 0, 0.9);
      }

      button {
      	color: #FFFFFF;
        font-size:20px;
        background-repeat: no-repeat;
      	background-position: center;
      	background-size: 26%;
      	background-color: #000000;
        border: 3px solid #FFFFFF;
        border-radius: 7px;
      }

      button:focus,
      button:active,
      button:hover {
        color: #000000;
        background-color: #8E8E8E;
      }

      #logout {
      	margin: 5;
      	border-radius: 7px;
      	background-image: image(url("icons/logout.png"));
      }
      #suspend {
      	margin: 5px;
      	border-radius: 7px;
      	background-image: image(url("icons/suspend.png"));
      }
      #shutdown {
      	margin: 5px;
      	border-radius: 7px;
      	background-image: image(url("icons/shutdown.png"));
      }
      #reboot {
      	margin: 5px;
      	border-radius: 7px;
      	background-image: image(url("icons/reboot.png"));
      }
      #lock {
      	margin: 5px;
      	border-radius: 7px;
      	background-image: image(url("icons/lock.png"));
      }
      #hibernate {
      	margin: 5px;
      	border-radius: 7px;
      	background-image: image(url("icons/hibernate.png"));
      }
    '';
    };
    home.file.".config/wlogout/icons" = {
      source = ../../../wlogouticons;
      recursive = true;
    };
  };
}