{ config, lib, pkgs, ... }:

let
  cfg = config.modules.hack_nerd-font;
in
{
  options.modules.hack_nerd-font.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the hack_nerd-font module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [ nerd-fonts.hack ];
  };
}