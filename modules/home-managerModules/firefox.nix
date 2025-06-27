{ config, lib, pkgs, ... }:

let
  cfg = config.modules.firefox;
in
{
  options.modules.firefox.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the firefox module";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
    };
  };
}