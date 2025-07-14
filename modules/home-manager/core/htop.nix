{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.htop;
in {
  options.modules.htop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the htop module";
  };

  config = lib.mkIf cfg.enable {
    programs.htop = {
      enable = true;
    };
  };
}
