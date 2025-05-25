
{ config, lib, pkgs, ... }:

let
  cfg = config.modules.allowunfree;
in
{
  options.modules.allowunfree.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the allowunfree module";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;
  };
}