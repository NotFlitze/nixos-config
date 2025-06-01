{ config, lib, pkgs, ... }:

let
  cfg = config.modules."prusa-slicer";
in
{
  options.modules."prusa-slicer".enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the prusa-slicer module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ prusa-slicer ];
  };
}
