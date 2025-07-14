{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.modules.glmark2;
in {
  options.modules.glmark2.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the glmark2 module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [glmark2];
  };
}
