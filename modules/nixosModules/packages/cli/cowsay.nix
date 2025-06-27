{ config, lib, pkgs, ... }:

let
  cfg = config.modules.cowsay;
in
{
  options.modules.cowsay.enable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Enable the cowsay module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ cowsay ];
  };
}