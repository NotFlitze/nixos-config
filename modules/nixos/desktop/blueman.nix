{
  config,
  lib,
  ...
}: let
  cfg = config.modules.services.blueman;
in {
  options.modules.services.blueman.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable blueman manager";
  };

  config = lib.mkIf cfg.enable {
    services.blueman.enable = true;
  };
}
