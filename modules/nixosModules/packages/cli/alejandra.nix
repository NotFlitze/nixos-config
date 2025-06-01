{ config, lib, pkgs, ... }:

let
  cfg = config.modules.alejandra;
in
{
  options.modules.alejandra.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the alejandra module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ alejandra ];
  };
}
