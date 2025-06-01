{ config, lib, ... }:

let
  cfg = config.modules.networkmanager;
in
{
  options.modules.networkmanager.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable NetworkManager service";
  };

  config = lib.mkIf cfg.enable {
    networking.networkmanager.enable = true;
  };
}
