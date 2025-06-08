{ config, lib, ... }:

let
  cfg = config.modules.gnome;
in
{
  options.modules.gnome.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable GNOME desktop manager";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.desktopManager.gnome.enable = true;
    programs.dconf.enable = true;
  };
}
