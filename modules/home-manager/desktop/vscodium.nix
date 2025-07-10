{ config, lib, pkgs, ... }:

let
  cfg = config.modules.vscodium;
in
{
  options.modules.vscodium.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the vscodium module";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
    };
  };
}