{ config, lib, pkgs, ... }:

let
  cfg = config.modules.nwg-displays;
in
{
  options.modules.nwg-displays.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the nwg-displays module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nwg-displays ];
  };
}