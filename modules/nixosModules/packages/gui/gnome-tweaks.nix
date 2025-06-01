{ config, lib, pkgs, ... }:

let
  cfg = config.modules.gnome-tweaks;
in
{
  options.modules.gnome-tweaks.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the gnome-tweaks module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ gnome-tweaks ];
  };
}