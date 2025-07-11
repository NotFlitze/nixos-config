{ config, lib, ... }:

let
  cfg = config.modules.dbus;
in
{
  options.modules.dbus.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable dbus module";
  };

  config = lib.mkIf cfg.enable {
    services.dbus.enable = true;
  };
}
