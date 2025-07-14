{
  config,
  lib,
  ...
}: let
  cfg = config.modules.printing;
in {
  options.modules.printing.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable printing service (CUPS)";
  };

  config = lib.mkIf cfg.enable {
    services.printing.enable = true;
  };
}
