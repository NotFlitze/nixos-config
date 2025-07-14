{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.btop;
in {
  options.modules.btop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the btop module";
  };

  config = lib.mkIf cfg.enable {
    programs.btop = {
      enable = true;
    };
  };
}
