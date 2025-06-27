{ config, lib, pkgs, ... }:

let
  cfg = config.modules.wget;
in
{
  options.modules.wget.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the wget module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ wget ];
  };
}
