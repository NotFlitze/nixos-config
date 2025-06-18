{ config, lib, pkgs, ... }:

let
  cfg = config.modules.vesktop;
in
{
  options.modules.vesktop.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the vesktop module";
  };

  config = lib.mkIf cfg.enable {
    programs.vesktop = {
      enable = true;

    };
  };
}