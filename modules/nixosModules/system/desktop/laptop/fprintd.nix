{ config, lib, pkgs, ... }:

let
  cfg = config.modules.fprintd;
in
{
  options.modules.fprintd.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable fprintd module";
  };

  config = lib.mkIf cfg.enable {
      services.fprintd.enable = true;
      services.fprintd.tod.enable = true;
      services.fprintd.tod.driver = pkgs.libfprint-2-tod1-broadcom;
  };
}