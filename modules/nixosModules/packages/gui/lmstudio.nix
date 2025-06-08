{ config, lib, pkgs, ... }:

let
  cfg = config.modules."lmstudio";
in
{
  options.modules."lmstudio".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the lmstudio module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ lmstudio ];
  };
}