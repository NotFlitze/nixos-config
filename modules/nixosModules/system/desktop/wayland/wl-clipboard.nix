{ config, lib, pkgs, ... }:

let
  cfg = config.modules.wl-clipboard;
in
{
  options.modules.wl-clipboard.enable = lib.mkOption {
    type = lib.types.bool;
    default = true;
    description = "Enable the wl-clipboard module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [ wl-clipboard ];
  };
}