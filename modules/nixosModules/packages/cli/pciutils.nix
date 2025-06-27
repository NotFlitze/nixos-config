{ config, lib, pkgs, ... }:

let
  cfg = config.modules.pciutils;
in
{
  options.modules.pciutils.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the pciutils module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ pciutils ];
  };
}