{ config, lib, ... }:

let
  cfg = config.modules.xkb;
in
{
  options.modules.xkb.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable XKB layout";
  };

  config = lib.mkIf cfg.enable {
    services.xserver.xkb.layout = "de";
  };
}
