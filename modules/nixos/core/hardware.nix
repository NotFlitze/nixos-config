{
  config,
  lib,
  ...
}: let
  cfg = config.modules.hardware;
in {
  options.modules.hardware.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable general hardware support (firmware, graphics)";
  };

  config = lib.mkIf cfg.enable {
    hardware.enableAllFirmware = true;

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
