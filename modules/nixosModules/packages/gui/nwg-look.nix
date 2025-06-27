{ config, lib, pkgs, ... }:

let
  cfg = config.modules.nwg-look;
in
{
  options.modules.nwg-look.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the nwg-look module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ nwg-look ];
  };
}