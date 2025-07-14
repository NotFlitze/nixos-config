{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.consoleKeymap;
in {
  options.modules.consoleKeymap.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the consoleKeymap module";
  };

  config = lib.mkIf cfg.enable {
    console.keyMap = "de";
  };
}
