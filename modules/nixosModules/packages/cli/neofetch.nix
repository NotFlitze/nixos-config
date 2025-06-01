{ config, lib, pkgs, ... }:

let
  cfg = config.modules.neofetch;
in
{
  options.modules.neofetch.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the neofetch module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ neofetch ];
  };
}
