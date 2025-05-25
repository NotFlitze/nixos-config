{ config, lib, pkgs, ... }:

let
  cfg = config.modules.vscode;
in
{
  options.modules.vscode.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the vscode module";
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
    };
  };
}