{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.evtest;
in {
  options.modules.evtest.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the evtest module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [evtest];
  };
}
