{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.modules.swww;
in {
  options.modules.swww.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the swww module";
  };

  config = lib.mkIf cfg.enable {
    services.swww = {
      enable = true;
      package = inputs.swww.packages.${pkgs.system}.swww;
    };
  };
}