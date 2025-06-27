{ config, lib, ... }:

let
  cfg = config.modules.gdm;
in
{
  options.modules.gdm.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable gdm service";
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
      xkb.layout = "de";
    };
  };
}
