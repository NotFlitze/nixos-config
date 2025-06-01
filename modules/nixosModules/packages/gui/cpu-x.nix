{ config, lib, pkgs, ... }:

let
  cfg = config.modules."cpu-x";
in
{
  options.modules."cpu-x".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the cpu-x module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ cpu-x ];
  };
}
