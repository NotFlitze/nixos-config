{ config, lib, pkgs, ... }:

let
  cfg = config.modules.btop-rocm;
in
{
  options.modules.btop-rocm.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Install btop-rocm for enhanced GPU monitoring on AMD systems";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ pkgs.btop-rocm ];
  };
}
