{ config, lib, pkgs, ... }:

let
  cfg = config.modules.kitty;
in
{
  options.modules.kitty.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the kitty module";
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "Hack Nerd Font";
        size = 10;
      };
      settings = {
        background_opacity = "0.8";
      };
    };
  };
}