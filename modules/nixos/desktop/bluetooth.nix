{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.bluetooth;
in {
  options.modules.bluetooth.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the bluetooth module";
  };

  config = lib.mkIf cfg.enable {
    hardware.bluetooth.enable = true;
  };
}
